using System;

namespace _29_06_2021_SimpleBinaryTree
{

    public class BinaryTree
    {
        public class TreeNode
        {
            public TreeNode Left = null;
            public TreeNode Right = null;
            public int info;
        }

        TreeNode Head = null;

        public string PrintTree()
        {
            //OriginFrame.AddLog("Вывод дерева(возраста)");
            string result = "";
            print_Tree_Hidden(Head, 0, ref result);
            return result;
        }

        private void print_Tree_Hidden(TreeNode p, int level, ref string result)
        {
            if (p != null)
            {
                print_Tree_Hidden(p.Right, level + 1, ref result);
                for (int i = 0; i < level; i++) result += "   ";
                result += p.info + "\n";
                print_Tree_Hidden(p.Left, level + 1, ref result);
            }
        }

        public bool Add(int info)
        {
            var NewData = new TreeNode();
            NewData.info = info;

            if (Head == null)
            {
                Head = NewData;
                return true;
            }

            TreeNode mover = Head;
            while (true)
            {
                if (info >= mover.info)
                {
                    if (mover.Right == null)
                    {
                        mover.Right = NewData;
                        return true;
                    } 
                    else
                    {
                        mover = mover.Right;
                    }
                }
                else
                {
                    if (mover.Left == null)
                    {
                        mover.Left = NewData;
                        return true;
                    }
                    else
                    {
                        mover = mover.Left;
                    }
                }
            }
        }

        public TreeNode GetParent(TreeNode node)
        {
            TreeNode mover = Head;
            while (mover != null)
            {
                if (node.info >= mover.info)
                {
                    if (mover.Right == node)
                    {
                        return mover;
                    }
                    else
                    {
                        mover = mover.Right;
                    }
                }
                else
                {
                    if (mover.Left == node)
                    {
                        return mover;
                    }
                    else
                    {
                        mover = mover.Left;
                    }
                }
            }
            return null;
        }

        private void DeleteSubFunction(TreeNode Node)
        {
            if (Node == Head)
            {
                if (Node.Left != null)
                    Head = Node.Left;
                else if (Node.Right != null)
                    Head = Node.Right;
                else
                    Head = null;

                return;
            }


            var Parent = GetParent(Node);
            if (Parent == null) return;

            if (Parent.Left == Node)
            {
                if (Node.Left != null)
                {
                    Parent.Left = Node.Left;
                }
                else if (Node.Right != null)
                {
                    Parent.Left = Node.Right;
                }
                else
                {
                    Parent.Left = null;
                }
            } 
            else
            {
                if (Node.Left != null)
                {
                    Parent.Right = Node.Left;
                }
                else if (Node.Right != null)
                {
                    Parent.Right = Node.Right;
                }
                else
                {
                    Parent.Right = null;
                }
            }
            GC.Collect();
        }

        public TreeNode Find(int info)
        {
            var mover = Head;
            while (mover != null)
            {
                if (info == mover.info)
                {
                    return mover;
                }
                else if (info > mover.info)
                {
                    mover = mover.Right;
                }
                else
                {
                    mover = mover.Left;
                }
            }
            return null;
        }

        public bool Delete(int info)
        {
            var NodeToDelete = Find(info);
            if (NodeToDelete == null) return false;
            
            if (NodeToDelete.Left != null && NodeToDelete.Right != null)
            {
                var MaxLeftElem = NodeToDelete.Left;
                while (MaxLeftElem.Right != null)
                {
                    MaxLeftElem = MaxLeftElem.Right;
                }
                var InfoToChange = MaxLeftElem.info;
                DeleteSubFunction(MaxLeftElem);
                NodeToDelete.info = InfoToChange;
            }
            else
            {
                DeleteSubFunction(NodeToDelete);
            }

            return false;
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            BinaryTree tree = new BinaryTree();
            tree.Add(325);
            tree.Add(125);

            Console.WriteLine(tree.PrintTree());
            tree.Delete(125);
            Console.WriteLine(tree.PrintTree());
            tree.Delete(325);
            Console.WriteLine(tree.PrintTree());
        }
    }
}
