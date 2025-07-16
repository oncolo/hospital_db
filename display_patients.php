<!DOCTYPE html>
<html>
<head>
    <title>View Patients</title>
    <link rel="stylesheet" href="style.css">
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 8px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <header><h1>Patient List</h1></header>
    <main>
        <table>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Gender</th>
                <th>Age</th>
                <th>Address</th>
            </tr>
            <?php
            // Database connection (same as before)
            $conn = mysqli_connect("localhost", "root","","Hospital_DB");
if ($conn->connect_error){
    echo 'Connection successful';
}else{
    echo '';
}

            // SQL to get all patients
            $sql = "SELECT PatientID, FirstName, LastName, Gender, Age, Address FROM PatientTable";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                // output data of each row
                while($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["PatientID"] . "</td>";
                    echo "<td>" . $row["FirstName"] . "</td>";
                    echo "<td>" . $row["LastName"] . "</td>";
                    echo "<td>" . $row["Gender"] . "</td>";
                    echo "<td>" . $row["Age"] . "</td>";
                    echo "<td>" . $row["Address"] . "</td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='6'>No patients found</td></tr>";
            }
            $conn->close();
            ?>
        </table>
    </main>
    <footer><p>© 2024 Tikur Anbesa Hospital</p></footer>
</body>
</html>