/// import System.Console;
/// import System.ComponentModel.Primitives;
/// import System.ComponentModel.TypeConverter;
/// import System.Windows.Forms;;
using System;
using System.Windows.Forms;

public class Program
{
    [STAThread]
    public static void Main()
    {
        Application.EnableVisualStyles();
        Application.SetCompatibleTextRenderingDefault(false);
        Application.Run(new MainForm());
    }
}

public class MainForm: Form
{
    private System.ComponentModel.IContainer components = null;

    private void InitializeComponent()
    {
        // Initialize Component
        this.components = new System.ComponentModel.Container();
        var button1 = new Button();
        this.SuspendLayout();
        // Add to UI
        this.Text = "Window";
        button1.Text = "Button";
        button1.Click += new System.EventHandler(this.Button1_Click);
        this.Controls.Add(button1);
    }

    public MainForm()
    {
        InitializeComponent();
    }

    private void Button1_Click(object sender, EventArgs e)
    {
        Console.WriteLine("Hello, World!");
        MessageBox.Show("Hello, World!", "Title");
    }
}
