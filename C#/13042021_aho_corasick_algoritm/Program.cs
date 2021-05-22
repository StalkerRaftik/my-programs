using System;
using System.Collections.Generic;

namespace _13042021_aho_corasick_algoritm
{
    class Bor
    {
        public Node Head;
        public Bor() {
            this.Head = new Node();
            this.Head.nRef = this.Head;
        }

        public class Node
        {
            public Node(char i, int level)
            {
                this.s = i;
                this.level = level;
            }
            public Node() { }

            public void Print()
            {
                string termStr = this.isTerm != "" ? "(терминальный)" : "";
                Console.WriteLine("Я" + termStr + ": " + this.s + "\nМои дети:");
                foreach(var child in this.childs)
                {
                    Console.Write(child.Value.s + " ");
                }
                Console.WriteLine("\nЯ указываю на:" + this.nRef.s);
            }

            public string isTerm = "";
            public char s;
            public Node nRef;
            public int level = 0;
            public Dictionary<char, Node> childs = new Dictionary<char, Node>();
        }

        public void BuildRefs()
        {
            Node Parent = this.Head;
            List<KeyValuePair<Node, KeyValuePair<char, Node>>> queue = new List<KeyValuePair<Node, KeyValuePair<char, Node>>>();
            foreach (KeyValuePair<char, Node> pair in Parent.childs)
            {
                KeyValuePair<Node, KeyValuePair<char, Node>> queuePair = new KeyValuePair<Node, KeyValuePair<char, Node>>(Parent, pair);
                queue.Add(queuePair);
            }

            while (queue.Count != 0)
            {
                Parent = queue[0].Key;
                var Pair = queue[0].Value;
                var k = Pair.Key;
                var v = Pair.Value;
                queue.RemoveAt(0);

                var mover = Parent.nRef;
                while (mover != this.Head)
                {
                    if (mover.childs.ContainsKey(k))
                    {
                        v.nRef = mover.childs[k];
                        break;
                    }
                    mover = mover.nRef;
                }
                if (mover == this.Head)
                {
                    // Если у корня есть нужный потомок
                    if (mover.childs.ContainsKey(k))
                    {
                        // Если мы потомок корня, то присваиваем ссылку на корень
                        if (mover.childs[k] == v) v.nRef = this.Head;
                        // Иначе
                        else v.nRef = mover.childs[k];
                    }
                    // Если нет нужного потомка, то мы присваиваем корень
                    else v.nRef = this.Head;

                }

                // Добавляем в конец очереди детей
                foreach (KeyValuePair<char, Node> pair in v.childs)
                {
                    KeyValuePair<Node, KeyValuePair<char, Node>> queuePair = new KeyValuePair<Node, KeyValuePair<char, Node>>(v, pair);
                    queue.Add(queuePair);
                }
            }
        }

        public void BuildTerminalRefs()
        {
            Node Parent = this.Head;
            List<KeyValuePair<Node, KeyValuePair<char, Node>>> queue = new List<KeyValuePair<Node, KeyValuePair<char, Node>>>();
            foreach (KeyValuePair<char, Node> pair in Parent.childs)
            {
                KeyValuePair<Node, KeyValuePair<char, Node>> queuePair = new KeyValuePair<Node, KeyValuePair<char, Node>>(Parent, pair);
                queue.Add(queuePair);
            }

            while (queue.Count != 0)
            {
                var Pair = queue[0].Value;
                var v = Pair.Value;
                queue.RemoveAt(0);

                if (v.nRef.isTerm != "") v.isTerm = v.nRef.isTerm;


                // Добавляем в конец очереди детей
                foreach (KeyValuePair<char, Node> pair in v.childs)
                {
                    KeyValuePair<Node, KeyValuePair<char, Node>> queuePair = new KeyValuePair<Node, KeyValuePair<char, Node>>(v, pair);
                    queue.Add(queuePair);
                }
            }
        }

        public void AddString(string str)
        {
            Node mover = this.Head;
            for (int i = 0; i < str.Length; i++) 
            {
                char w = str[i];
                if (!mover.childs.ContainsKey(w))
                {
                    mover.childs.Add(w, new Node(w, i));
                }

                if (i == str.Length - 1)
                {
                    mover.childs[w].isTerm = str;
                }
                
                
                mover = mover.childs[w];
            }
        }

        public void FindSubs(string str, string[] subs)
        {
            foreach (var sub in subs)
            {
                Console.WriteLine(sub);
                this.AddString(sub);
            }
            Console.WriteLine();
            this.BuildRefs();
            this.BuildTerminalRefs();

            Node state = this.Head;
            for(int i = 0; i < str.Length; i++)
            {

                if (state.childs.ContainsKey(str[i]))
                {
                    state = state.childs[str[i]];
                    if (state.isTerm != "")
                    {
                        Console.WriteLine("Строка " + state.isTerm + " найдена в интервале ["
                            + (i - state.level).ToString()
                            + "," + i
                            + "]");
                    }
                } else
                {
                    state = state.nRef;
                    if (state.childs.ContainsKey(str[i])) state = state.childs[str[i]];
                    if (state.isTerm != "")
                    {
                        Console.WriteLine("Строка " + state.isTerm + " найдена в интервале ["
                            + (i - state.level).ToString()
                            + "," + i
                            + "]");
                    }
                }
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Введите строку");
            string StringToHandle = Console.ReadLine();

            Console.WriteLine("Введите числовые последовательности через пробел");
            string input = "";
            input = Console.ReadLine();
            string[] subs = input.Split(' ');

            
            Bor bor = new Bor();
            bor.FindSubs(StringToHandle, subs);
        }
    }
}
