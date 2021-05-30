using System;
using System.Collections.Generic;
using System.IO;
//Неориентированный граф, невзвешенный, нерекурсивный
//Матрица смежности, обход в ширину, в файле информация по вершинам

namespace Graph_NoOriented
{
    class NoOrientedGraph
    {
        // Двумерный лист - матрица смежности. на данном этапе создалась лишь строка, столбцов нет
        Dictionary<int, Dictionary<int, bool>> mtx = new Dictionary<int, Dictionary<int, bool>>();

        public void AddVerge(int node1, int node2)
        {
            if (!this.mtx.ContainsKey(node1)) this.CreateNode(node1);
            if (!this.mtx.ContainsKey(node2)) this.CreateNode(node2);

            if (!this.mtx[node1].ContainsKey(node2)) this.mtx[node1].Add(node2, true);
            if (!this.mtx[node2].ContainsKey(node1)) this.mtx[node2].Add(node1, true);
        }

        public void RemoveVerge(int node1, int node2)
        {
            if (!this.mtx.ContainsKey(node1)) return;
            if (!this.mtx.ContainsKey(node2)) return;

            this.mtx[node1].Add(node2, false);
            this.mtx[node2].Add(node1, false);
        }

        public void CreateNode(int node)
        {
            if (this.mtx.ContainsKey(node)) return;

            this.mtx.Add(node, new Dictionary<int, bool>());
        }

        public void DeleteNode(int node)
        {
            if (!this.mtx.ContainsKey(node)) return;

            this.mtx.Remove(node);

            foreach (KeyValuePair<int, Dictionary<int, bool>> entry in this.mtx)
            {
                int FromNodeIndex = entry.Key;
                var NodesWithVerge = entry.Value;

                foreach(KeyValuePair<int, bool> entry2 in NodesWithVerge)
                {
                    if (entry2.Key == node)
                    {
                        NodesWithVerge.Remove(node);
                    }
                    break;
                }
            }
        }

        public void BFS(int startNode)
        {
            Queue<int> queue = new Queue<int>();
            Dictionary<int, bool> visitedNodes = new Dictionary<int, bool>();
            visitedNodes.Add(startNode, true);
            queue.Enqueue(startNode);

            int CurNode = -1;
            while(queue.Count != 0)
            {
                CurNode = queue.Dequeue();
                foreach (KeyValuePair<int, bool> KVNodes in this.mtx[CurNode])
                {
                    var key = KVNodes.Key;
                    if (visitedNodes.ContainsKey(key)) continue;

                    queue.Enqueue(key);
                    Console.WriteLine(CurNode + "-->" + key);
                    visitedNodes.Add(key, true);
                }
            }
        }

        public void Print()
        {
            List<int> keys = new List<int>();
            foreach (KeyValuePair<int, Dictionary<int, bool>> entry in this.mtx)
            {
                keys.Add(entry.Key);
            }
            keys.Sort();

            foreach(int key in keys)
            {
                Console.Write("Существует вершина " + key + ", пути от неё есть в: ");
                foreach(KeyValuePair<int,bool> KVverge in this.mtx[key])
                {
                    Console.Write(KVverge.Key + ", ");
                }
                Console.WriteLine();
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            NoOrientedGraph g = new NoOrientedGraph();

            // Считывание с файла
            int nCount = 0;
            string path = @"C:\Important\Studying\my-programs\C#\Graph_NoOriented\graph.txt";
            using (StreamReader sr = new StreamReader(path, System.Text.Encoding.Default))
            {
                string line = sr.ReadLine();
                nCount = Int32.Parse(line);

                Dictionary<int, bool> NodeAdded = new Dictionary<int, bool>();
                while ((line = sr.ReadLine()) != null)
                {
                    string[] subs = line.Split(" ");
                    int node1 = Int32.Parse(subs[0]);

                    g.CreateNode(node1);
                    if (!NodeAdded.ContainsKey(node1)) NodeAdded.Add(node1, true);

                    for (int i = 1; i < subs.Length; i++)
                    {
                        int key = Int32.Parse(subs[i]);
                        if (!NodeAdded.ContainsKey(key)) NodeAdded.Add(key, true);
                        g.AddVerge(node1, key);
                    }
                }

                if (NodeAdded.Count != nCount)
                {
                    Console.WriteLine("Указано неверное количество вершин! Программа завершается!");
                    return;
                }
            }

            g.Print();
            g.BFS(5);
        }

        // Queue, Dictionary, List, StreamReader, Int32.Parse, Console.Write/WriteLine, KeyValuePair для Dictionary
    }
}
