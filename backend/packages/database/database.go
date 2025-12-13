package database

import (
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/ignratnan/ics-notes.com/backend/models"
	"github.com/ignratnan/ics-notes.com/backend/packages/sessions"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var db *gorm.DB

func ConnectDB() {
	dsn := "host=localhost user=postgres password=jkfd90-= dbname=icsnotes port=5432 sslmode=disable"
	var err error
	db, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("Failed to connect to database!")
	}
}

func CheckAdmin() bool {
	var count int64
	result := db.Model(&models.Admin{}).Count(&count)

	if result.Error != nil {
		log.Println("Error counting admin records:", result.Error)
		return false // Handle database error
	}
	// Return true if count > 0 (admins exist)
	return count > 0
}

func CreateAdmin(adminStatus bool) {
	if !adminStatus {
		hashedPassword, _ := bcrypt.GenerateFromPassword([]byte("admin"), bcrypt.DefaultCost)
		password := string(hashedPassword)
		admin := models.Admin{
			Role:     "admin",
			Password: password,
		}

		db.Create(&admin)
	}
}

func GetUsers(c *gin.Context) {
	var getUsers []models.User
	db.Find(&getUsers)
	c.JSON(http.StatusOK, getUsers)
}

func GetNotes(c *gin.Context) {
	var getNotes []models.Note
	db.Preload("User").Preload("Event").Preload("Contact").Preload("Company").Find(&getNotes)
	c.JSON(http.StatusOK, getNotes)
}

func GetEvents(c *gin.Context) {
	var getEvents []models.Event
	db.Preload("User").Find(&getEvents)
	c.JSON(http.StatusOK, getEvents)
}

func GetEventByID(c *gin.Context) {
	// 1. Get the ID from the URL parameter (e.g., "5" from /events/5)
	eventID := c.Param("id")

	var event models.Event

	// 2. Use GORM's First() method to query the database:
	//    - Preload("User"): Still includes related user data.
	//    - First(&event, eventID): Finds the first record where the primary key (ID)
	//      matches the eventID variable.
	result := db.Preload("User").First(&event, eventID)

	if result.Error != nil {
		// 3. Handle errors (e.g., record not found)
		if result.Error == gorm.ErrRecordNotFound {
			c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
			return
		}
		// Handle other database errors
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Database error"})
		return
	}

	// 4. Send the specific event data
	c.JSON(http.StatusOK, event)
}

func GetContacts(c *gin.Context) {
	var getContacts []models.Contact
	db.Preload("User").Preload("Company").Order("first_name asc").Find(&getContacts)
	c.JSON(http.StatusOK, getContacts)
}

func GetContactById(c *gin.Context) {
	contactID := c.Param("id")

	var contact models.Contact

	result := db.Preload("User").First(&contact, contactID)

	if result.Error != nil {
		// 3. Handle errors (e.g., record not found)
		if result.Error == gorm.ErrRecordNotFound {
			c.JSON(http.StatusNotFound, gin.H{"error": "Contact not found"})
			return
		}
		// Handle other database errors
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Database error"})
		return
	}

	// 4. Send the specific contact data
	c.JSON(http.StatusOK, contact)
}

func PostContact(c *gin.Context) {
	var postContacts models.Contact
	if err := c.ShouldBindJSON(&postContacts); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	if result := db.Create(&postContacts); result.Error != nil {
		log.Println("Error inserting new post:", result.Error)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save post to database."})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"message": "Post saved successfully!"})
}

func EditContact(c *gin.Context) {
	// --- 1. Get ID from URL Parameter ---
	// The ID determines which record to update.
	idParam := c.Param("id")
	contactID, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid contact ID format"})
		return
	}

	// --- 2. Bind JSON Payload & Validate ---
	var input models.Contact
	// Gin's ShouldBindJSON automatically validates fields tagged with `binding:"required"`
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// --- 3. Find the Existing Record ---
	var contact models.Contact
	// Find the record by its primary key
	if result := db.First(&contact, contactID); result.Error != nil {
		if result.Error == gorm.ErrRecordNotFound {
			c.JSON(http.StatusNotFound, gin.H{"error": "Contact not found"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Database lookup failed"})
		return
	}

	// --- 4. Update the GORM Model Fields ---
	// Apply the changes from the validated input to the fetched record.
	contact = input
	// event.SomeOtherField = input.SomeOtherField // Apply other fields...

	// --- 5. Save/Persist the Changes ---
	if result := db.Save(&contact); result.Error != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save updates to database"})
		return
	}

	// --- 6. Send Success Response ---
	c.JSON(http.StatusOK, gin.H{
		"message":  "Contact updated successfully",
		"event_id": contact.ID,
	})

}

func DeleteContact(c *gin.Context) {
	contactID := c.Param("id")

	if contactID == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Contact ID is required"})
		return
	}

	result := db.Delete(&models.Contact{}, contactID)

	if result.Error != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Database error while deleting"})
		return
	}

	if result.RowsAffected == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "Contact not found or already deleted"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Contact deleted successfully"})
}

func GetCompanies(c *gin.Context) {
	var getCompanies []models.Company
	db.Preload("User").Order("company_name asc").Find(&getCompanies)
	c.JSON(http.StatusOK, getCompanies)
}

func GetCreateEvent(c *gin.Context) {
	var getEvents []models.Event
	db.Preload("User").Find(&getEvents)
	c.JSON(http.StatusOK, getEvents)
}

func PostCreateEvent(c *gin.Context) {
	var postEvents models.Event
	if err := c.ShouldBindJSON(&postEvents); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	if result := db.Create(&postEvents); result.Error != nil {
		log.Println("Error inserting new post:", result.Error)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save post to database."})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"message": "Post saved successfully!"})
}

func EditEvent(c *gin.Context) {
	// --- 1. Get ID from URL Parameter ---
	// The ID determines which record to update.
	idParam := c.Param("id")
	eventID, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID format"})
		return
	}

	// --- 2. Bind JSON Payload & Validate ---
	var input models.UpdateEventInput
	// Gin's ShouldBindJSON automatically validates fields tagged with `binding:"required"`
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// --- 3. Find the Existing Record ---
	var event models.Event
	// Find the record by its primary key
	if result := db.First(&event, eventID); result.Error != nil {
		if result.Error == gorm.ErrRecordNotFound {
			c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Database lookup failed"})
		return
	}

	// --- 4. Update the GORM Model Fields ---
	// Apply the changes from the validated input to the fetched record.
	event.EventName = input.EventName
	// event.SomeOtherField = input.SomeOtherField // Apply other fields...

	// --- 5. Save/Persist the Changes ---
	if result := db.Save(&event); result.Error != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save updates to database"})
		return
	}

	// --- 6. Send Success Response ---
	c.JSON(http.StatusOK, gin.H{
		"message":  "Event updated successfully",
		"event_id": event.ID,
	})

}

func DeleteEvent(c *gin.Context) {
	eventID := c.Param("id")

	if eventID == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Event ID is required"})
		return
	}

	result := db.Delete(&models.Event{}, eventID)

	if result.Error != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Database error while deleting"})
		return
	}

	if result.RowsAffected == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found or already deleted"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Event deleted successfully"})
}

func PostLogin(c *gin.Context) {
	var postLogin models.LoginRequest
	var getAdmins []models.Admin
	var getUsers []models.User
	var adminStatus int = 0
	var userStatus int = 0
	var inPassword string = ""
	var usPassword string = ""
	var adPassword string = ""
	var message string = ""

	// --- Session Variables ---
	var authenticatedUserID uint = 0
	var authenticatedRole string = ""

	db.Find(&getUsers)
	db.Find(&getAdmins)

	if err := c.ShouldBindJSON(&postLogin); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	for i := range getAdmins {
		if postLogin.Email == getAdmins[i].Role {
			err := bcrypt.CompareHashAndPassword([]byte(getAdmins[i].Password), []byte(postLogin.Password))
			if err == nil {
				// Admin credentials are VALID
				adminStatus = 1
				authenticatedUserID = getAdmins[i].ID // Store the Admin's ID
				authenticatedRole = "admin"
				break // Exit loop once found and authenticated
			}
		}
	}

	if adminStatus == 0 {
		for i := range getUsers {
			if postLogin.Email == getUsers[i].Email {
				err := bcrypt.CompareHashAndPassword([]byte(getUsers[i].Password), []byte(postLogin.Password))
				if err == nil {
					// User credentials are VALID
					userStatus = 1
					authenticatedUserID = getUsers[i].ID // Store the User's ID
					authenticatedRole = "user"
					break // Exit loop once found and authenticated
				} else {
					// Password comparison failed for this user
					message = "Wrong email or password!"
				}
			}
		}
	}

	if authenticatedUserID > 0 {
		sessions.Start(authenticatedUserID)

		c.JSON(http.StatusOK, gin.H{
			"message":     "Login successful",
			"role":        authenticatedRole,
			"adminStatus": adminStatus,
			"userStatus":  userStatus,
			"inPassword":  inPassword,
			"adPassword":  adPassword,
			"usPassword":  usPassword,
		})
	} else {
		c.JSON(http.StatusUnauthorized, gin.H{
			"message": message, // Or a more generic message for security
		})
	}
}

func LogoutHandler(c *gin.Context) {

	c.JSON(http.StatusOK, gin.H{"message": "Logged out successfully."})
}

func AddSession(session models.Session) {
	if result := db.Create(session); result.Error != nil {
		log.Println("Error inserting new post:", result.Error)
		return
	}
}
