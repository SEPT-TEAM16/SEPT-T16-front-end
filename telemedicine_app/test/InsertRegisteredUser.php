<?php 
	include "config.php";
	// REGISTER USER
	

        $role = mysqli_real_escape_string($connect, $_POST['role']);
	    $firstName = mysqli_real_escape_string($connect, $_POST['firstName']);
        $lastName = mysqli_real_escape_string($connect, $_POST['lastName']);
        $gender = mysqli_real_escape_string($connect, $_POST['gender']);
        $dateOfBirth = mysqli_real_escape_string($connect, $_POST['dateOfBirth']);
        $mobile = mysqli_real_escape_string($connect, $_POST['mobile']);
        $email = mysqli_real_escape_string($connect, $_POST['email']);
        $address = mysqli_real_escape_string($connect, $_POST['address']);
        $password = mysqli_real_escape_string($connect, $_POST['password']);
	 
	        $query = "INSERT INTO registereduser (name, email,mobile)
	  			  VALUES('$name', '$email','$mobile')";
	    $results = mysqli_query($connect, $query);
	    if($results>0)
	    {
	        echo "user added successfully";
	    }
	    
	    
	

	

	    
	    
	    ?>