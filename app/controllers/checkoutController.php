<?php
namespace App\Controllers;


use App\Models;

class CheckoutController extends AppController
{
    protected $model = "";
    protected $params = [];

    public function __construct(string $action = NULL, array $params)
    {
        parent::__construct($action, $params);

        $this->action = $action;
        $this->params = $params;
        $this->getCart();
    }

    public function index(array $params)
    {   
        //\Framework\debug($_SESSION);
        $preTotal = $this->calculateTotalPayment();
        $totalPayment = $preTotal + ($preTotal * VAT);


        $this->view->assign("title", "Checkout");
        $this->view->assign("totalPayment", $totalPayment);

        $this->view->display("cart/checkout.tpl");
    }
    public function paymentConfirmation(array $params)
    {   
        $this->view->assign("title", "Confirmation");

        $this->view->display("cart/confirmation.tpl");
    }

    public function dummy(array $params)
    {   
        $this->view->assign("title", "Checkout test");

        $this->view->display("cart/dummypage.tpl");
    }
    public function calculateTotalPayment(): float
    {
        $total = 0.00;
 
        if(isset($_SESSION['shoppingCart']) != null)
            foreach($_SESSION['shoppingCart'] as $ticket)     
                $total += $ticket[1];
 
        return $total;
    }
    public function generate()
    {

        $pdf = new \FPDF('P','mm','A4');
        $pdf->AddPage();
        $pdf->SetFont('Arial','B',16);
        $pdf->Cell(40,10,'Hello World!',1);
        $pdf->Cell(60,10,'Powered by FPDF.',0,1,'C');
        $pdf->Output();

    }
    public function send_pdf_to_user(){
        if(
            $_REQUEST['action'] == 'pdf_invoice' ){
            require('html2pdf.php');
            require_once('class.phpmailer.php');
            $pdf=new PDF_HTML();
            $pdf->SetFont('Arial','',11);
            $pdf->AddPage();
    
            $text = get_html_message($_REQUEST['eventid'], $_REQUEST['userid']);
            if(ini_get('magic_quotes_gpc')=='1')
            $text=stripslashes($text);
            $pdf->WriteHTML($text);
    
            $mail = new PHPMailer(); // defaults to using php "mail()"
            $body = "This is test mail by monirul";
    
            $mail->AddReplyTo("webmaster@test.ch","Test Lernt");
            $mail->SetFrom('webmaster@test.ch', 'Test Lernt');
    
            $address = "elizabeth.erickson21@gmail.com";
            $mail->AddAddress($address, "Elizabeth Erickson");       
            $mail->Subject    = "Test Invoice";       
            $mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test
    
            $mail->MsgHTML($body);
            //documentation for Output method here: http://www.fpdf.org/en/doc/output.htm       
            $pdf->Output("Test Invoice.pdf","F");
            $path = "Walter Lernt Invoice.pdf";
    
            $mail->AddAttachment($path, '', $encoding = 'base64', $type = 'application/pdf');
            global $message;
            if(!$mail->Send()) {
              $message =  "Invoice could not be send. Mailer Error: " . $mail->ErrorInfo;
            } else {
              $message = "Invoice sent!";
            }
    
        }
    }

}
?>