<?php
// --- DATABASE CONNECTION ---
$conn = mysqli_connect("localhost", "root","","Hospital_DB");
if ($conn->connect_error){
    echo 'Connection failed';
}else{
    echo '';
}

// --- HANDLE FORM SUBMISSION ---
// This part only runs when the form is submitted (method is POST)
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize inputs to prevent SQL injection, a good practice
    $patient_id = $conn->real_escape_string($_POST['patient_id']);
    $doctor_id = $conn->real_escape_string($_POST['doctor_id']);
    $date = $conn->real_escape_string($_POST['date']);
    $time = $conn->real_escape_string($_POST['time']);
    $reason = $conn->real_escape_string($_POST['reason']);
    $status = $conn->real_escape_string($_POST['status']);

    // The SQL query is now guaranteed to have valid IDs
    $sql = "INSERT INTO AppointmentTable (PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, Status) 
            VALUES ('$patient_id', '$doctor_id', '$date', '$time', '$reason', '$status')";

    if ($conn->query($sql) === TRUE) {
        $success_message = "New appointment created successfully!";
    } else {
        // More descriptive error message for debugging
        $error_message = "Error: " . $sql . "<br>" . $conn->error;
    }
}

// --- FETCH DATA FOR DROPDOWNS ---
// Always fetch patients and doctors to populate the form
$patients_result = $conn->query("SELECT PatientID, FirstName, LastName FROM PatientTable");
$doctors_result = $conn->query("SELECT DoctorID, FirstName, LastName, Specialty FROM DoctorTable");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Appointment</title>
    <link rel="stylesheet" href="style.css"> <!-- Optional: Link your stylesheet -->
    <style>
        body { font-family: sans-serif; margin: 2em; }
        form { max-width: 500px; }
        label { display: block; margin-top: 1em; }
        input, select, textarea { width: 100%; padding: 8px; margin-top: 5px; }
        button { background-color: #007bff; color: white; padding: 10px 15px; border: none; cursor: pointer; margin-top: 1em; }
        .message { padding: 1em; margin-bottom: 1em; border-radius: 5px; }
        .success { background-color: #d4edda; color: #155724; }
        .error { background-color: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <h2>Add New Appointment</h2>

    <?php
    // Display success or error messages if they exist
    if (isset($success_message)) {
        echo "<div class='message success'>$success_message</div>";
    }
    if (isset($error_message)) {
        echo "<div class='message error'>$error_message</div>";
    }
    ?>

    <form method="post" action="add_appointment.php">
        
        <label for="patient_id">Patient:</label>
        <select id="patient_id" name="patient_id" required>
            <option value="">-- Select a Patient --</option>
            <?php
            // Populate patient dropdown
            if ($patients_result->num_rows > 0) {
                while($row = $patients_result->fetch_assoc()) {
                    // The value is the ID, the text shown to the user is the name
                    echo "<option value='" . $row['PatientID'] . "'>" . $row['FirstName'] . " " . $row['LastName'] . "</option>";
                }
            }
            ?>
        </select>
        
        <label for="doctor_id">Doctor:</label>
        <select id="doctor_id" name="doctor_id" required>
            <option value="">-- Select a Doctor --</option>
            <?php
            // Populate doctor dropdown
            if ($doctors_result->num_rows > 0) {
                while($row = $doctors_result->fetch_assoc()) {
                    echo "<option value='" . $row['DoctorID'] . "'>" . $row['FirstName'] . " " . $row['LastName'] . " (" . $row['Specialty'] . ")</option>";
                }
            }
            ?>
        </select>
        
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required>
        
        <label for="time">Time:</label>
        <input type="time" id="time" name="time" required>

        <label for="reason">Reason for Visit:</label>
        <textarea id="reason" name="reason" rows="4" required></textarea>
        
        <label for="status">Status:</label>
        <input type="text" id="status" name="status" value="Scheduled" readonly>
        
        <button type="submit">Add Appointment</button>
    </form>

</body>
</html>
<?php
// Close the connection at the very end of the script
$conn->close();
?>