<?php
  $allcancel = $cancel_request->GetAllCancelReq();
  if($allcancel)
  $data = mysqli_fetch_all($allcancel,MYSQLI_ASSOC);
  
?>
<?php 
  if(isset($_POST['delete']))
     { 
        $pnr_no = $_POST['pnr_no'];
        $delete_tkt = $cancel_request->DeleteRequest($pnr_no);
                       
      $sms = '<div class="alert alert-success alert-dismissable" style="text-align:center; font-size:25px;"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>'.$delete_tkt.'</strong> </div>';
     }
 ?>


<script type="text/javascript">
		  function confirmation() {
		  return confirm('Are you sure you want to do this?');
			}
</script>
		
    <section class="content-header">
      <h1>Manage Cancel Requests</h1>
	  
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
          <div class="box">
            <div class="box-header with-border"style="text-align:center;">
              <h3 class="box-title" style="font-weight: bolder;" >All Cancel Requests</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tr>
                  <th>Sl.</th>
                  <th>PNR No</th>                                          
                  <th>Name</th>                                             
                  <th>Email</th>
                  <th>Contact No</th>
                  <th>Bkash No</th>
                  <th>Refund Amount</th>
                  <th>Cancel Date</th>
                  <th>Request Status</th>                                                      
                  <th>Action</th>

                </tr>
		   <?php
		  
		    $i=1;
        if(isset($data)){
		    foreach($data as $value)
		    { 
			 //foreach($seatdata as $v){ foreach($v as $c){} }
		    ?>
                		 
			<form  method="post" action="">
			    <tr>
                  <td><h5><?php echo $i; ?></h5></td>                                           
                  <td><h5><?php echo $value['pnr_no']; ?></h5></td>                                           
                  <td><h5><?php echo  $value['name']; ?></h5></td>                                                                                    
                  <td><h5><?php echo  $value['email']; ?></h5></td>                                           
                  <td><h5><?php echo  $value['mobile']; ?></h5></td>                                           
                  <td><h5><?php echo  $value['bkash_no']; ?></h5></td>                                           
                  <td><h5><?php echo  $value['refund']; ?></h5></td>                                           
                  <td><h5><?php echo  date('d/m/y h:i A', strtotime($value['cancel_date'])); ?> </h5></td>                                           
                  <td><?php if ( $value['cancel_status'] == 1){ ?><a class="btn btn-xs btn-success"><span class="glyphicon glyphicon-check"></span> Canceled</a><?php }elseif( $value['cancel_status'] == 0){?><a class="btn btn-xs btn-warning"><span class="glyphicon glyphicon-off"></span> pending</a><?php }elseif( $value['cancel_status'] == '2'){?><a class="btn btn-xs btn-danger"><span class="glyphicon glyphicon-remove-sign"></span> Rejected</a><?php }?></td>                                           
				  <?php if ( $value['cancel_status'] != 1){?><td><a href="dashboard.php?page=view_cancel_request&id=<?php echo $value['request_id']; ?>&pnr=<?php echo $value['pnr_no'] ;?>" target=_blank class="btn btn-xs btn-info"><i class="fa fa-clock-o"></i> View details</a></td>	<?php }  else {?>
          
          <td class="center">
            <form method="post" action="">   
              <input type="hidden" name="pnr_no" value="<?php echo $value['pnr_no']; ?>">   
                <button type="submit" name="delete" class="btn btn-xs btn-danger" onclick="return confirmation()"><i class="fa fa-trash-o"></i> Delete Request</button>
  
            </form>         
         </td>

          <?php } ?>

                </tr>
								
				<?php
			    $i++;
				}
      }
				?>

              </table> <br />
			  
			  </form>
				
            </div>
            
        </div>
        </div>
       
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
