<?php
	$cancel_id = $_GET['id'];
	$pnr = $_GET['pnr'];
  $cancel_information = $cancel_request->GetCancelRequestById($cancel_id);
  $data = $cancel_information->fetch_assoc();
  //echo '<script>alert('.$data.')</script>';
?>


<?php 
	$seats= $booked_seat->BookedSeatsByOnlyPnr($pnr);
	$seat_no = array();
	if($seats){
		$value = mysqli_fetch_all($seats,MYSQLI_ASSOC);
		
		for ($i=0; $i<count($value); $i++) {
			array_push($seat_no, $value[$i]['seat_no']);
		}
	}
 ?>

?>

<?php 
	if(isset($_POST['reject']))
		{ 
		    $pnr_no = $_POST['pnr_no']; 
			$reject = $cancel_request->reject_request($pnr_no);
                       
			$sms = '<div class="alert alert-success alert-dismissable" style="text-align:center; font-size:25px;"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>'.$reject.'</strong> </div>';
		}
		
		 
	if(isset($_POST['delete']))
		 { 
		       $pnr_no = $_POST['pnr_no'];
			  $delete_tkt = $cancel_request->DeleteRequest($pnr_no);
                       
			$sms = '<div class="alert alert-success alert-dismissable" style="text-align:center; font-size:25px;"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>'.$delete_tkt.'</strong> </div>';
		 }

	


//dj

		if(isset($_POST['cancel']))
		{
		    $pnr_no = $_POST['pnr_no'];
			$Approve = $cancel_request->ApproveRequest($pnr_no);

			$journey_date= $data['journey_date'];
			$boarding= $data['counter_name'];
				
            $passenger_email= $data['email'];		
            $name= $data['name'];		
            $refund= $data['refund'];		
            $bkash_no= $data['bkash_no'];		

			if($Approve)
			   {	$mail = new PHPMailer(true);                              // Passing `true` enables exceptions
					try {
						//Server settings
						//$mail->SMTPDebug = 2;                                 // Enable verbose debug output
						$mail->isSMTP();                                      // Set mailer to use SMTP
						$mail->Host = 'ssl://smtp.gmail.com';                       // Specify main and backup SMTP servers
						$mail->SMTPAuth = true;                               // Enable SMTP authentication
						$mail->Username = 'onlineticketbd83@gmail.com';                 // SMTP username
						$mail->Password = 'aslam14103148';                           // SMTP password
						$mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
						$mail->Port = 465;                                    // TCP port to connect to
						$mail->SMTPOptions = array(
							'ssl' => array(
								'verify_peer' => false,
								'verify_peer_name' => false,
								'allow_self_signed' => true
							)
						);

						//Recipients
						$mail->setFrom('onlineticketbd83@gmail.com', 'BUS Tickets Management System');
						$mail->addAddress($passenger_email, $name);     // Add a recipient					
						$mail->addReplyTo('info@example.com', 'Information');
						$mail->addCC('cc@example.com');
						$mail->addBCC('bcc@example.com');

						//Attachments
						//$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
						//$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

						//Content
						$mail->isHTML(true);                                  // Set email format to HTML
						$mail->Subject = 'Cancel Confirmation';
						$mail->Body    = 'Hello! '.$name.', your booking has been Canceled as your request. <br />Your PNR No: '.$pnr_no.'<br> Journey Date: '.$journey_date.'<br>We have send the total amount of refund: '.$refund.'TK to '.$bkash_no.' number';
						
						$mail->AltBody = '! Your Cancel rewuest has been confirmed.';

						$mail->send();
						//echo 'Message has been sent';
						} catch (Exception $e) {
							echo 'Message could not be sent.';
							echo 'Mailer Error: ' . $mail->ErrorInfo;
						} 
		   
		   			echo "<script>alert('Successfully approved cancel request and send mail to'".$passenger_email.");</script>";
					$sms = '<div class="alert alert-success alert-dismissable" style="text-align:center; font-size:25px;"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong> Cancel Request Approved!</strong> </div>';

					
			   }  else {
					  echo "<script>alert('Something problem to send notification');</script>";

					  $sms = '<div class="alert alert-danger alert-dismissable"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> unsuccessfull ! </div>';
			   }
		}	














 ?>



<script type="text/javascript">
		  function confirmation() {
		  return confirm('Are you sure you want to delete this request?');
			}
</script>
		
    <section class="content-header">
      <h1> Cancel Information</h1>
	  
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title"></h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
		
		<?php if(isset($sms)){echo $sms;} ?>
		
        <div class="box-body">
		
          <div class="col-md-12">

            
			<table class="table table-striped table-bordered table-hover" id="dataTables-example">
			<div class="panel-heading" style="background-color:#232d4f; height: 40px;"><p style="font-size:20px;color:white;">Passenger Details</p></div>

			
			<form  method="post" action="">
			
                        <tr>
                            <th>Passenger Name:</th>
                            <td><?php echo  $data['name']; ?></td>
							 <th>Address:</th>
                            <td><?php echo  $data['address']; ?></td> 
                      
                        </tr>
						
                        <tr>
                            <th>Contact No:</th>
                            <td><?php echo  $data['mobile']; ?></td>
						   <th>Email:</th>
						   <td><?php echo  $data['email']; ?></td> 							
                        </tr> 					
						
                    </table> <br />
					
				<table class="table table-striped table-bordered table-hover" id="dataTables-example">
				<div class="panel-heading" style="background-color:#44495b; height: 40px;"><p style="font-size:20px;color:white;">Cancel Details</p></div>
                         <tr>
                            <th>PNR No:</th>
                            <td><?php echo  $data['pnr_no']; ?></td>
							<th>Cancel Date:</th>
                            <td><?php echo  date('d/m/y h:i A', strtotime($data['cancel_date'])); ?></td>
                      
                        </tr>                        
						
						<tr>
                            <th>Bkash No:</th>
                            <td><?php echo  $data['bkash_no']; ?></td>
							<th>Refund Amount:</th>
                            <td><?php echo  $data['refund']; ?></td>
                      
                        </tr>							
						
						

						<tr>

							<th>Current Status:</th>
                            <td><?php if ( $data['cancel_status'] == 0){echo "pending";} elseif( $data['cancel_status'] == 1){echo "Canceled";} elseif( $data['cancel_status'] ==2){echo "Reject";}?></td>
							
                        </tr>							
						
				
						
                </table>
				
			
				<div class=" col-md-offset-2">
				
				<input type="hidden" name="pnr_no" value="<?php echo $data['pnr_no']; ?>">	
				<button type="submit" name="cancel" class="btn btn-lg btn-success"><i class="fa fa-check-square"></i> Approve Request</button>
				<button type="submit" name="reject" class="btn btn-lg btn-warning"><i class="fa fa-window-close"></i> Reject Request</button>
				<button type="submit" name="delete" class="btn btn-lg btn-danger" onclick="return confirmation()"><i class="fa fa-trash-o"></i> Delete Request</button>

				
               </div>
			   
			   </form>

        </div>
       
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
