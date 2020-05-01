
    <section class="content-header">
      <h1> Dashboard</h1>
      
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
		
        <div class="box-body">
		
        <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><?php echo $sqlBus['total']; ?></h3>

              <p>Total Buses</p>
            </div>
            <div class="icon">
              <i class="ion ion-android-bus"></i>
            </div>
            <a href="dashboard.php?page=manage_bus" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
		  
		
		  <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><?php echo $pending_tickets['total']; ?></h3>

              <p>Booking Request</p>
            </div>
            <div class="icon">
              <i class="ion ion-ios-email"></i>
            </div>
            <a href="dashboard.php?page=manage_request" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
		
		 <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><?php echo $sold_tickets['total']; ?></h3>

              <p>Ticket Sold</p>
            </div>
            <div class="icon">
              <i class="ion ion-ios-checkmark-outline"></i>
            </div>
            <a href="dashboard.php?page=manage_request" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div> 
		
		 <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><?php echo $cancel_tickets['total']; ?></h3>

              <p> Cancel Request</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="dashboard.php?page=manage_cancel_request" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
		  
        </div>
		
		 <div class="row">
        <!-- Left col -->
       
		  <div>
		  

		

      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
