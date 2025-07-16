# Activity 1: Create a Patient class
class Patient:
    """A class to represent a patient in a hospital."""
    
    def __init__(self, name, age, illness):
        """Initialize the patient's attributes."""
        self.name = name
        self.age = age
        self.illness = illness

    def display_details(self):
        """A method to display the patient's details."""
        print("--- Patient Details ---")
        print(f"Name: {self.name}")
        print(f"Age: {self.age}")
        print(f"Illness: {self.illness}")
        print("-----------------------")

# Activity 2: Add predefined patients and store them in a list
def main():
    """Main function to create and manage patients."""
    
    # Create 3 patient objects with fixed data
    patient1 = Patient("John Doe", 45, "Hypertension")
    patient2 = Patient("Jane Smith", 32, "Common Cold")
    patient3 = Patient("Peter Jones", 58, "Diabetes")

    # Store them in a list called 'patients'
    patients = [patient1, patient2, patient3]
    
    # Display the details of all critical patients in the list
    print("Displaying information for all patients in the system:")
    for patient in patients:
        patient.display_details()

# Run the main function
if __name__ == "__main__":
    main()