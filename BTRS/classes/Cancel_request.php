<?php
$filepath = realpath(dirname(__FILE__));
include_once ($filepath."/../libs/Database.php");
include_once ($filepath."/../helpers/Format.php");
?>

<?php
/**
* Counter_info class
*/
class Cancel_request
{
	private $db;
	private $fm;
	
	function __construct()
	{
		$this->db = new Database();
		$this->fm = new Format();
	}
	
	//fetch all Bus list
	public function GetAllCity(){
		$sql = "SELECT DISTINCT city_name FROM tbl_cities ORDER BY city_name ASC";
		$result = $this->db->select($sql);
		return $result;
	}


	public function Cancel_Request($data){
		$pnr_no = $this->test_input($data['pnr_no']);
		$passenger_id = $this->test_input($data['passenger_id']);
		$counter_id = $this->test_input($data['counter_id']);
		$refund = $this->test_input($data['refund']);
		$bkash_no = $this->test_input($data['bkash_no']);

		if (empty($pnr_no) || empty($refund) || empty($passenger_id) || empty($counter_id) || empty($bkash_no)  )
		{
			$msg = "Fields must not be empty !";
			return $msg;
		}

		else{
			$Check_cancel = "SELECT * FROM tbl_cancel_request WHERE pnr_no='$pnr_no'";
			$result = $this->db->select($Check_cancel);

			if ($result != false) {
				$msg = "Your have alraedy resquest for cancel. Wait for approval. or contact with us! ";
				return $msg;
			}
			
			else{
				$sql = "INSERT INTO tbl_cancel_request(passenger_id,pnr_no,counter_id,bkash_no,refund) VALUES('$passenger_id','$pnr_no','$counter_id','$bkash_no','$refund')";
			    $inserted = $this->db->insert($sql);

			    if ($inserted) {
			    	$msg = "Your Cancel_Request is succesfully done. Wait for confirmation";
				    return $msg;
			    }else{
			    	$msg = "Failed to cancel! contact menually";
					return $msg;
			    }
			}
		}
	}

	public function GetAllCancelReq(){
		$sql = "SELECT * FROM tbl_cancel_request INNER JOIN tbl_passenger_info ON tbl_cancel_request.passenger_id = tbl_passenger_info.id ORDER BY request_id DESC";
		$result = $this->db->select($sql);
		return $result;
	}

	public function GetAllPendingrequest(){
		$sql = "SELECT COUNT(*) AS total FROM tbl_cancel_request WHERE cancel_status =0";
		$result = $this->db->select($sql);
		return $result;
	}

	public function GetCancelRequestById($request_id){
		$sql = "SELECT * FROM tbl_cancel_request INNER JOIN tbl_passenger_info ON tbl_cancel_request.passenger_id = tbl_passenger_info.id INNER JOIN tbl_counter_info ON tbl_cancel_request.counter_id = tbl_counter_info.counter_id INNER JOIN tbl_booking_info ON tbl_cancel_request.pnr_no = tbl_booking_info.pnr_no WHERE tbl_cancel_request.request_id = '$request_id'";
		$result = $this->db->select($sql);
		return $result;
	}

	public function reject_request($pnr){
		$pnr_no = $this->test_input($pnr);

		$sql = "UPDATE tbl_cancel_request SET cancel_status='2' WHERE pnr_no='$pnr_no'";

		$result = $this->db->update($sql);
		if ($result) {
			$msg = "Rejected!";
			return $msg;
		}
		else{
			$msg = "<span class='error'>Filed to Rejected !.</span>";
			return $msg;
		}
		
	}

	public function DeleteRequest($pnr){
		$pnr_no = $this->test_input($pnr);

		$sql = "DELETE  FROM tbl_cancel_request WHERE pnr_no = '$pnr_no'";

		$result = $this->db->Delete($sql);
		if ($result) {
			$msg = "Deleted!";
			return $msg;
		}
		else{
			$msg = "<span class='error'>Filed to Delete !.</span>";
			return $msg;
		}
		
	}

	public function ApproveRequest($pnr){
		$pnr_no = $this->test_input($pnr);
		$sql = "UPDATE tbl_cancel_request SET cancel_status='1' WHERE pnr_no='$pnr_no'";


		$result = $this->db->update($sql);
		if ($result) {
			$sql = "DELETE tbl_booking_info , tbl_booked_seats  FROM tbl_booking_info  INNER JOIN tbl_booked_seats WHERE tbl_booking_info.pnr_no= tbl_booked_seats.pnr_no and tbl_booked_seats.pnr_no = '$pnr_no'";

			$result = $this->db->Delete($sql);
			if($result)
				return true;

		}
		else{
			return false;
		}
		
	}


	public function test_input($data){
		$data =trim($data);
		$data =stripslashes($data);
		$data =htmlspecialchars($data);
		$data = $this->fm->validation($data);
		$data = mysqli_real_escape_string($this->db->link, $data);


		return $data;
	}

}

?>