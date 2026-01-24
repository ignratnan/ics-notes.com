package auth

import (
	"net/http"

	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
	"github.com/ignratnan/ics-notes.com/backend/models"
	"github.com/ignratnan/ics-notes.com/backend/packages/database"
	"golang.org/x/crypto/bcrypt"
)

func AdminCheck() {
	var admin models.Admin
	countAdmin := database.CountAdmins()
	if countAdmin == 0 {
		hashedPassword, _ := bcrypt.GenerateFromPassword([]byte("admin"), bcrypt.DefaultCost)
		password := string(hashedPassword)
		admin = models.Admin{
			Role:     "admin",
			Password: password,
		}
	}

	database.CreateAdmin(admin)
}

func Login(c *gin.Context) {
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

	getUsers = database.ReadUsers()
	getAdmins = database.ReadAdmins()

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
		session := sessions.Default(c)
		session.Set("user_id", authenticatedUserID)
		session.Set("role", authenticatedRole)
		session.Save()

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
