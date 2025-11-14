package database

import (
	"log"
	"net/http"

	"golang.org/x/crypto/bcrypt"

	"github.com/gin-gonic/gin"
	"github.com/ignratnan/ics-notes.com/backend/models"
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

func GetEvents(c *gin.Context) {
	var getEvents []models.Event
	db.Preload("User").Find(&getEvents)
	c.JSON(http.StatusOK, getEvents)
}

func GetContacts(c *gin.Context) {
	var getContacts []models.Contact
	db.Preload("User").Preload("Company").Order("first_name asc").Find(&getContacts)
	c.JSON(http.StatusOK, getContacts)
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

func PostLogin(c *gin.Context) {
	var postLogin models.LoginRequest
	var getAdmins []models.Admin
	var getUsers []models.User
	var adminStatus int = 0
	var userStatus int = 0
	var inPassword string = ""
	var usPassword string = ""
	var adPassword string = ""

	db.Find(&getUsers)
	db.Find(&getAdmins)

	if err := c.ShouldBindJSON(&postLogin); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	for i := range getAdmins {
		if postLogin.Email == getAdmins[i].Role {
			err := bcrypt.CompareHashAndPassword([]byte(getAdmins[i].Password), []byte(postLogin.Password))
			if err != nil {
				hashedPassword, _ := bcrypt.GenerateFromPassword([]byte(postLogin.Password), bcrypt.DefaultCost)
				inPassword = string(hashedPassword)
				adPassword = getAdmins[i].Password
			} else {
				adminStatus = 1
			}
		}
	}

	for i := range getUsers {
		if postLogin.Email == getUsers[i].Email {
			err := bcrypt.CompareHashAndPassword([]byte(getUsers[i].Password), []byte(postLogin.Password))
			if err != nil {
				hashedPassword, _ := bcrypt.GenerateFromPassword([]byte(postLogin.Password), bcrypt.DefaultCost)
				inPassword = string(hashedPassword)
				usPassword = getUsers[i].Password
			} else {
				userStatus = 1
			}

		}
	}

	c.JSON(http.StatusCreated, gin.H{
		"adminStatus": adminStatus,
		"userStatus":  userStatus,
		"inPassword":  inPassword,
		"adPassword":  adPassword,
		"usPassword":  usPassword,
	})

}
