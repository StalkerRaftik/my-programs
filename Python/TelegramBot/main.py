import telebot
from telebot import types
import random
import vk_api

# vk_session = vk_api.VkApi('+79990593881', 'XXXXXXXXXXXXXXXXX')
# vk_session.auth()
#
# vk = vk_session.get_api()
#
# print(vk.wall.post(message='Hello world!'))


bot = telebot.TeleBot("1645621417:AAHGk5coXe87jywqcyhGBHwuljLIm6tm9b0")

vklogin = None
vkpass = None
dauth = None
def GetDataForVkConnection(message):
    id = message.chat.id
    global vklogin
    global vkpass

    if vklogin == True:
        vklogin = message.text
        bot.send_message(id, "Теперь введите пароль:")
        vkpass = True
    elif vkpass == True:
        vkpass = message.text
        markup = types.InlineKeyboardMarkup(row_width=2)
        item1 = types.InlineKeyboardButton("Да", callback_data='dauth_yes')
        item2 = types.InlineKeyboardButton("Нет", callback_data='dauth_no')

        markup.add(item1, item2)
        bot.send_message(id, "Подключена ли у вас двухфакторная аутентификация?:", reply_markup=markup)


def MainHandler(message):
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
            global vklogin
            vklogin = True


def callback_dAuthification(call):
    global dauth
    try:
        if call.message:
            if call.data == 'dauth_yes':
                dauth = True
            elif call.data == 'bad':
                dauth = False
        print(vklogin,vkpass,dauth)
        bot.send_message(call.message.chat.id, "Данные записаны.")

    except Exception as e:
        print(repr(e))

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



# Обработка начала общения
@bot.message_handler(commands=['start'])
def welcome(message):

    # keyboard
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
    item1 = types.KeyboardButton("🎲 Рандомное число")
    item2 = types.KeyboardButton("😊 Как дела?")
    item3 = types.KeyboardButton("Получать сообщения из ВК")

    markup.add(item1, item2, item3)

    bot.send_message(message.chat.id,
                     "Добро пожаловать, {0.first_name}!\nЯ - <b>{1.first_name}</b>, бот созданный чтобы быть подопытным кроликом.".format(
                         message.from_user, bot.get_me()),
                     parse_mode='html', reply_markup=markup)


#Обработка входящего текста
@bot.message_handler(content_types=['text'])
def BotMessageReceived(message):
    global vkpass, vklogin
    if not vkpass is None or not vklogin is None:
        GetDataForVkConnection(message)
    MainHandler(message)


#Обработка коллбэков
@bot.callback_query_handler(func=lambda call: True)
def GlobalQueryProc(call):
    callback_inlineDialogue(call)
    callback_dAuthification(call)


# RUN
bot.polling(none_stop=True)