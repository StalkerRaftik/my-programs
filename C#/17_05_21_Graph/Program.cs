using System;
using System.Collections.Generic;
using System.IO;

namespace _17_05_21_Graph
{
    
    class TwoLinkedList
    {
        public class Elem
        {
            public Elem Prev; // Previous
            public Elem Next; // Next
            public int Info;
        }

        public Elem Head;
        public Elem Tail;
        public int Count { get; private set; }

        public void Add(int info)
        {
            Elem NewEl = new Elem();
            NewEl.Info = info;

            if (this.Head == null)
            {
                this.Head = NewEl;
                this.Tail = NewEl;
            } else
            {
                this.Tail.Next = NewEl;
                NewEl.Prev = this.Tail;
                this.Tail = NewEl;
            }
            this.Count++;
        }

        public void Remove(int info)
        {
            Elem mover = this.Head;

            while (mover != null)
            {
                if (mover.Info == info)
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

        public Elem Find(int info)
        {
            Elem mover = this.Head;

            while (mover != null)
            {
                if (mover.Info == info)
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
                Console.WriteLine(mover.Info);
                mover = mover.Next;
            }
        }
    }

    class OrientedGraph
    {
        public TwoLinkedList[,] List;

        public int NodesCount;

        private OrientedGraph() { }

        public OrientedGraph(int NodesCount)
        {
            this.NodesCount = NodesCount;
            List = new TwoLinkedList[NodesCount, NodesCount];
            for (int i = 0; i < NodesCount; i++)
                for (int j = 0; j < NodesCount; j++)
                    List[i, j] = new TwoLinkedList();
        }

        public void AddVerge(int from, int to, int weight)
        {
            List[from, to].Add(weight);
        }

        public void RemoveVerge(int from, int to, int weight)
        {
            List[from, to].Remove(weight);
        }

        public void PrintVerges()
        {
            for (int i = 0; i < this.List.GetLength(0); i++)
                for (int j = 0; j < this.List.GetLength(1); j++)
                {
                    var List = this.List[i, j];
                    if (List.Count > 0)
                    {
                        var mover = List.Head;
                        while (mover != null)
                        {
                            Console.WriteLine((i+1).ToString() + "-->" + (j+1).ToString() + "\t" + mover.Info.ToString());
                            mover = mover.Next;
                        }
                    }
                }
        }

        bool[] VergeVisited;
        // Первый вызов очищает массив посещенных вершин.
        public void PrintDFS(int el)
        {
            this.VergeVisited = new bool[this.NodesCount];
            PrintDFSHidden(el);  
        }

        private void PrintDFSHidden(int el)
        {
            this.VergeVisited[el] = true;

            for (int i = 0; i < this.NodesCount; i++)
            {
                if (!VergeVisited[i] && this.List[el, i].Count != 0)
                {
                    VergeVisited[i] = true;
                    Console.WriteLine((el + 1).ToString() + "-->" + (i + 1).ToString());
                    PrintDFSHidden(i);
                }
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
                    Console.Write("Введите количество узлов: ");
                    nCount = Int32.Parse(Console.ReadLine());

                    g = new OrientedGraph(nCount);
                    break;
                case 2:
                    string path = @"C:\Important\Studying\my-programs\C#\17_05_21_Graph\graph.gph";

                    using (StreamReader sr = new StreamReader(path, System.Text.Encoding.Default))
                    {
                        string line = sr.ReadLine();
                        nCount = Int32.Parse(line);
                        g = new OrientedGraph(nCount);


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

                Console.WriteLine("0 - завершить программу");
                menuInt = Int32.Parse(Console.ReadLine());
                int input1;
                int input2;
                int input3;
                switch (menuInt)
                {
                    case 1:
                        Console.Write("Из узла: ");
                        input1 = CheckBorders(Int32.Parse(Console.ReadLine()), 1, nCount);
                        Console.Write("В узел: ");
                        input2 = CheckBorders(Int32.Parse(Console.ReadLine()), 1, nCount);
                        Console.Write("Вес пути: ");
                        input3 = Int32.Parse(Console.ReadLine());

                        

                        g.AddVerge(input1-1, input2-1, input3);
                        break;
                    case 2:
                        Console.Write("Из узла: ");
                        input1 = CheckBorders(Int32.Parse(Console.ReadLine()), 1, nCount);
                        Console.Write("В узел: ");
                        input2 = CheckBorders(Int32.Parse(Console.ReadLine()), 1, nCount);
                        Console.Write("Вес пути: ");
                        input3 = Int32.Parse(Console.ReadLine());

                        g.RemoveVerge(input1-1, input2-1, input3);
                        break;
                    case 3:
                        g.PrintVerges();
                        break;
                    case 4:
                        Console.Write("Из узла: ");
                        input1 = CheckBorders(Int32.Parse(Console.ReadLine()), 1, nCount);
                        g.PrintDFS(input1-1);
                        break;
                    case 5:
                        

                        break;
                }
            }
            
        }
    }
}
