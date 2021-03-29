import telebot
from telebot import types
import random
import sys
sys.path.append("../TelegramBot/")
from util import *
import vk_api
from vk_api.longpoll import VkLongPoll, VkEventType



bot = telebot.TeleBot("1645621417:AAHGk5coXe87jywqcyhGBHwuljLIm6tm9b0")
userstbl = dotdict(dict()) # Основная таблица с данными. Потом перекину в СУБД, а ща пока пусть в ОП чиллит


##################################
#### VK AUTHORIZATION FUNCTIONS ##
##################################

def PassSuccessFunc(message):
    id = message.chat.id
    global userstbl
    userstbl.id.password = message.text

    markup = types.InlineKeyboardMarkup(row_width=2)
    item1 = types.InlineKeyboardButton("Да", callback_data='dauth_yes')
    item2 = types.InlineKeyboardButton("Нет", callback_data='dauth_no')
    markup.add(item1, item2)

    bot.send_message(id, "Включена ли у вас двухфакторная аутентификация?", reply_markup=markup)
    userstbl.id.answercor = (None,None,None)
    userstbl.id.dauth = "waiting"


def LoginSuccessFunc(message):
    id = message.chat.id
    global userstbl
    userstbl.id.login = message.text
    bot.send_message(id, "Теперь введите пароль")
    userstbl.id.answercor = (PassSuccessFunc, None, None)

def DAuthSuccessFunc(message):
    global userstbl
    id = message.chat.id

    userstbl.id.dauthkey = message.text
    userstbl.id.answercor = (None,None,None)

def DAuthGetKey(id):
    bot.send_message(id, "Пожалуйста, напишите код ниже")
    userstbl.id.answercor = (DAuthSuccessFunc, None, None)

    while userstbl.id.dauthkey is None:
        continue
    bot.send_message(id, "Код был принят. Если вы еще раз получите просьбу написать код авторизации, \
значит, код был неправильный.")
    key = userstbl.id.dauthkey
    userstbl.id.dauthkey = None
    userstbl.id.answercor = (None,None,None)
    return str(key), True

def callback_dAuthification(call):
    global userstbl
    id = call.message.chat.id
    try:
        if call.message:
            if call.data == 'dauth_yes':
                userstbl.id.dauth = True
            elif call.data == 'dauth_no':
                userstbl.id.dauth = False

        if userstbl.id.dauth == True:
            bot.send_message(id, "Вам должен прийти код авторизации в личные сообщения Вконтакте.")
            userstbl.id.vkApi = vk_api.VkApi(userstbl.id.login, userstbl.id.password, auth_handler= lambda: DAuthGetKey(id))
        else:
            bot.send_message(id, "Авторизируюсь...")
            userstbl.id.vkApi = vk_api.VkApi(userstbl.id.login, userstbl.id.password, token = "1881bf1af89f62b12f5653e6f061c297f6953dc60c53b55587ca424ea943ce361123cb42629e97b1c0bbc", scope = 2|4|16|64|256|1024|2048|4096|8192|65536|131072|262144|524288|4194304)

        try:
            userstbl.id.vkApi.auth(token_only=True)
            userstbl.id.vkAccess = userstbl.id.vkApi.get_api()
            bot.send_message(id, "Авторизация прошла успешно.")
        except vk_api.AuthError as error_msg:
            print(error_msg)
            return
        print(userstbl.id.vkApi)
        userstbl.id.vkAccess.wall.post(message = "Балуюсь с ботом")

        try:
            userstbl.id.vkLongpoll = VkLongPoll(userstbl.id.vkApi)
        except vk_api.VkApiError as error_msg:
            print(error_msg)
            return

        for event in userstbl.id.vkLongpoll.listen():
            if event.type == VkEventType.MESSAGE_NEW and not event.from_me:
                str = ""

                if event.from_user:
                    str = str(event.user_id)
                elif event.from_chat:
                    str = str(event.user_id) + " в беседе " + str(event.chat_id)
                elif event.from_group:
                    str = "группа " + str(event.group_id)

                str = str + ":\n" + str(event.text)

                bot.send_message(id, str)


    except Exception as e:
        print(repr(e))


##################################
##### DIALOGUE FUNCTIONS #########
##################################

def callback_inlineDialogue(call):
    try:
        if call.message:
            if call.data == 'good':
                bot.send_message(call.message.chat.id, 'Вот и отличненько 😊')
            elif call.data == 'bad':
                bot.send_message(call.message.chat.id, 'Бывает 😢')
            #
            # # remove inline buttons
            # bot.edit_message_text(chat_id=call.message.chat.id, message_id=call.message.message_id, text="😊 Как дела?",
            #                       reply_markup=None)
            #
            # # show alert
            # bot.answer_callback_query(callback_query_id=call.id, show_alert=False,
            #                           text="ЭТО ТЕСТОВОЕ УВЕДОМЛЕНИЕ!!11")

    except Exception as e:
        print(repr(e))

##################################
############ MAIN ################
##################################

def WaitingForUserAnswer(message, args):
    successfunc = args[0]
    filterfunc = args[1]
    failfunc = args[2]

    if filterfunc is None:
        successfunc(message)
    elif filterfunc(message):
        successfunc(message)
    elif not failfunc is None:
        failfunc()


def MainKeyboardHandler(message):
    id = message.chat.id
    global userstbl


    if message.chat.type == 'private':
        if message.text == '🎲 Рандомное число':
            bot.send_message(message.chat.id, str(random.randint(0, 100)))
        elif message.text == '😊 Как дела?':

            markup = types.InlineKeyboardMarkup(row_width=2)
            item1 = types.InlineKeyboardButton("Хорошо", callback_data='good')
            item2 = types.InlineKeyboardButton("Не очень", callback_data='bad')

            markup.add(item1, item2)

            bot.send_message(message.chat.id, 'Отлично, сам как?', reply_markup=markup)
        elif message.text == "Получать сообщения из ВК":
            bot.send_message(message.chat.id, 'Введите логин от Вконтакте:')
            userstbl.id.answercor = (LoginSuccessFunc, None, None)






# Обработка начала общения
@bot.message_handler(commands=['start'])
def welcome(message):
    id = message.chat.id

    #remembering user
    global userstbl
    if userstbl.get(id) is None:
        userstbl.id = dotdict(dict())
        userstbl.id.answercor = (None, None, None) # Successfunc, Filterfunc, Failfunc - Cortage

    # keyboard
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
    item1 = types.KeyboardButton("🎲 Рандомное число")
    item2 = types.KeyboardButton("😊 Как дела?")
    item3 = types.KeyboardButton("Получать сообщения из ВК")

    markup.add(item1, item2, item3)

    bot.send_message(message.chat.id,
        "Добро пожаловать, {0.first_name}!\nЯ - <b>{1.first_name}</b>, бот созданный чтобы быть подопытным кроликом.".format(
        message.from_user, bot.get_me()),parse_mode='html', reply_markup=markup)


#Обработка входящего текста
@bot.message_handler(content_types=['text'])
def BotMessageReceived(message):
    global userstbl
    id = message.chat.id

    if userstbl.id is None:
        bot.send_message(id, "Вы не авторизированы в системе! Введите команду '/start', чтобы начать!")
        return

    if not userstbl.id.answercor[0] is None:
        WaitingForUserAnswer(message, userstbl.id.answercor)
    else:
        MainKeyboardHandler(message)


#Обработка коллбэков
@bot.callback_query_handler(func=lambda call: True)
def GlobalQueryProc(call):
    id = call.message.chat.id
    global userstbl
    if userstbl is None: return

    if userstbl.id.dauth == "waiting":
        callback_dAuthification(call)
    else:
        callback_inlineDialogue(call)


# RUN
bot.polling(none_stop=True)






