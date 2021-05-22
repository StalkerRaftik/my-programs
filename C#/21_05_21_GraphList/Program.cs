using System;
using System.Collections.Generic;
using System.IO;

namespace _21_05_21_GraphList
{
    class TwoLinkedList
    {
        public class Elem
        {
            public Elem Prev; // Previous
            public Elem Next; // Next
            public int Node;
            public int Weight;
        }

        public Elem Head;
        public Elem Tail;
        public int Count { get; private set; }

        public void Add(int node, int weight)
        {
            Elem NewEl = new Elem();
            NewEl.Node = node;
            NewEl.Weight = weight;

            if (this.Head == null)
            {
                this.Head = NewEl;
                this.Tail = NewEl;
            }
            else
            {
                this.Tail.Next = NewEl;
                NewEl.Prev = this.Tail;
                this.Tail = NewEl;
            }
            this.Count++;
        }

        public void Remove(int node, int weight)
        {
            Elem mover = this.Head;

            while (mover != null)
            {
                if (mover.Node == node && mover.Weight == weight)
                {
                    if (mover == this.Head)
                        this.Head = mover.Next;
                    if (mover == this.Tail)
                        this.Tail = mover.Prev;

                    if (mover.Prev != null)
                    {
                        mover.Prev.Next = mover.Next;
                    }
                    if (mover.Next != null)
                    {
                        mover.Next.Prev = mover.Prev;
                    }

                    mover = null;
                    GC.Collect();
                    GC.WaitForPendingFinalizers();
                    this.Count--;
                    break;
                }

                mover = mover.Next;
            }
        }

        public Elem FindByNode(int node)
        {
            Elem mover = this.Head;

            while (mover != null)
            {
                if (mover.Node == node)
                    return mover;

                mover = mover.Next;
            }

            return null;
        }

        public void Print()
        {
            Elem mover = this.Head;

            while (mover != null)
            {
                Console.WriteLine(mover.Node.ToString() + " " + mover.Weight.ToString());
                mover = mover.Next;
            }
        }
    }

    class OrientedGraph
    {
        public Dictionary<int, TwoLinkedList> List = new Dictionary<int, TwoLinkedList>();

        public void AddVerge(int from, int to, int weight)
        {
            if (!this.List.ContainsKey(from))
            {
                this.List.Add(from, new TwoLinkedList());
            }

            this.List[from].Add(to, weight);
        }

        public void RemoveVerge(int from, int to, int weight)
        {
            if (!this.List.ContainsKey(from)) return;

            this.List[from].Remove(to, weight);
        }

        public void PrintVerges()
        {
            foreach (KeyValuePair<int, TwoLinkedList> pair in this.List)
            {
                TwoLinkedList List = pair.Value;
                if (List == null) return;

                TwoLinkedList.Elem mover = List.Head;
                while (mover != null)
                {
                    Console.WriteLine((pair.Key+1).ToString() + "---->" + (mover.Node+1).ToString() + " " + mover.Weight.ToString());

                    mover = mover.Next;
                }
            }
        }

        public void AddNode(int node)
        {
            if (this.List.ContainsKey(node)) return;
            this.List.Add(node, new TwoLinkedList());
        }

        public void RemoveNode(int node)
        {
            if (this.List.ContainsKey(node))
                this.List.Remove(node);

            foreach(KeyValuePair<int, TwoLinkedList> pair in this.List)
            {
                TwoLinkedList tll = pair.Value;
                TwoLinkedList.Elem mover = tll.Head;
                
                while (mover != null)
                {
                    if (mover.Node == node)
                        tll.Remove(mover.Node, mover.Weight);

                    mover = mover.Next;
                }
            }
        }

        Dictionary<int, bool> VergeVisited = new Dictionary<int, bool>();
        public void PrintDFS(int from)
        {
            this.VergeVisited.Clear();
            this.VergeVisited.Add(from, true);
            if (!this.List.ContainsKey(from)) return;
            
            PrintDFSHidden(from);
        }

        // Первый вызов очищает массив посещенных вершин.
        private void PrintDFSHidden(int el)
        {
            if (!this.List.ContainsKey(el)) return;

            TwoLinkedList List = this.List[el];

            TwoLinkedList.Elem mover = List.Head;
            while (mover != null)
            {
                if (!this.VergeVisited.ContainsKey(mover.Node))
                {
                    Console.WriteLine((el+1).ToString() + "---->" + (mover.Node+1).ToString() + " " + mover.Weight.ToString());
                    this.VergeVisited.Add(mover.Node, true);
                    PrintDFSHidden(mover.Node);
                }

                mover = mover.Next;
            }

        }
    }


    class Program
    {
        static int CheckBorders(int info, int from, int to)
        {
            while (true)
            {
                if (info < from || info > to)
                {
                    Console.WriteLine("Вы ввели некорректное значение! Введите значение от " + from + " до " + to + "!");
                    info = Int32.Parse(Console.ReadLine());
                }
                else return info;
            }

        }

        static void Main(string[] args)
        {
            Console.WriteLine("Выберите тип создания графа: ");
            Console.WriteLine("1 - новый");
            Console.WriteLine("2 - считать с graph.gph");
            int nCount = CheckBorders(Int32.Parse(Console.ReadLine()), 1, 2);
            OrientedGraph g = null;
            switch (nCount)
            {
                case 1:
                    g = new OrientedGraph();
                    break;
                case 2:
                    string path = @"C:\Important\Studying\my-programs\C#\17_05_21_Graph\graph.gph";

                    using (StreamReader sr = new StreamReader(path, System.Text.Encoding.Default))
                    {
                        string line = sr.ReadLine();
                        nCount = Int32.Parse(line);
                        g = new OrientedGraph();


                        while ((line = sr.ReadLine()) != null)
                        {
                            string[] subs = line.Split(" ");
                            g.AddVerge(Int32.Parse(subs[0]) - 1, Int32.Parse(subs[1]) - 1, Int32.Parse(subs[2]));
                        }
                    }

                    break;
            }


            int menuInt = -1;
            while (menuInt != 0)
            {
                Console.WriteLine("Меню:");
                Console.WriteLine("1 - добавить путь");
                Console.WriteLine("2 - удалить путь");
                Console.WriteLine("3 - вывести таблицу путей");
                Console.WriteLine("4 - обход в глубину");
                Console.WriteLine("5 - добавить узел");
                Console.WriteLine("6 - удалить узел(включая пути с этим узлом)");
                // Добавление/удаление вершины, при удалении удалять ненужные пути, исправить считывание файла, проверка на количество вершин в файле
                // Кратчайший путь из всех во все. Даша агапова флойда оршелла алгоритм
                Console.WriteLine("0 - завершить программу");
                menuInt = Int32.Parse(Console.ReadLine());
                int input1;
                int input2;
                int input3;
                switch (menuInt)
                {
                    case 1:
                        Console.Write("Из узла: ");
                        input1 = Int32.Parse(Console.ReadLine());
                        Console.Write("В узел: ");
                        input2 = Int32.Parse(Console.ReadLine());
                        Console.Write("Вес пути: ");
                        input3 = Int32.Parse(Console.ReadLine());



                        g.AddVerge(input1 - 1, input2 - 1, input3);
                        break;
                    case 2:
                        Console.Write("Из узла: ");
                        input1 = Int32.Parse(Console.ReadLine());
                        Console.Write("В узел: ");
                        input2 = Int32.Parse(Console.ReadLine());
                        Console.Write("Вес пути: ");
                        input3 = Int32.Parse(Console.ReadLine());

                        g.RemoveVerge(input1 - 1, input2 - 1, input3);
                        break;
                    case 3:
                        g.PrintVerges();
                        break;
                    case 4:
                        Console.Write("Из узла: ");
                        input1 = Int32.Parse(Console.ReadLine());
                        g.PrintDFS(input1 - 1);
                        break;
                    case 5:
                        Console.Write("Номер узла: ");
                        input1 = Int32.Parse(Console.ReadLine());
                        g.AddNode(input1-1);

                        break;
                    case 6:
                        Console.Write("Номер узла: ");
                        input1 = Int32.Parse(Console.ReadLine());
                        g.RemoveNode(input1-1);

                        break;
                }
            }

        }
    }
    }
