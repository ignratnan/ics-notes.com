package request

import (
	"fmt"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/ignratnan/ics-notes.com/backend/models"
	"github.com/ignratnan/ics-notes.com/backend/packages/database"
	"golang.org/x/crypto/bcrypt"
	"gopkg.in/gomail.v2"
)

func GetUsers(c *gin.Context) {
	var getUsers []models.User
	getUsers = database.ReadUsers()
	c.JSON(http.StatusOK, getUsers)
}

func GetUserMe(c *gin.Context) {
	var getAdmin models.Admin
	var getUser models.User
	var userLogin string

	userID, _ := c.Get("user_id")
	userRole, _ := c.Get("role")

	switch userRole {
	case "admin":
		getAdmin = database.ReadAdmin(userID.(uint))
		userLogin = getAdmin.Role
	case "user":
		getUser = database.ReadUser(userID.(uint))
		userLogin = getUser.Name
	}

	c.JSON(http.StatusOK, gin.H{
		"userLogin": userLogin,
	})
}

func EditUser(c *gin.Context) {
	var input models.UserUpdate
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}
	hashedPassword, _ := bcrypt.GenerateFromPassword(
		[]byte(input.Password),
		bcrypt.DefaultCost,
	)

	input.Password = string(hashedPassword)

	database.UpdateUser(input)
	message := "The password successfully updated !"
	c.JSON(http.StatusOK, gin.H{
		"message": message,
	})
}

func ResetPasswordByUser(c *gin.Context) {
	var input models.FormResetPassword
	var user models.User
	var userUp models.UserUpdate
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	userID, _ := c.Get("user_id")
	idUint := userID.(uint)
	user = database.ReadUser(idUint)

	err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(input.OldPassword))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Incorrect password!"})
		return
	}

	hashedPassword, _ := bcrypt.GenerateFromPassword(
		[]byte(input.NewPassword),
		bcrypt.DefaultCost,
	)

	userUp.ID = idUint
	userUp.Name = user.Name
	userUp.Email = user.Email
	userUp.Password = string(hashedPassword)

	database.UpdateUser(userUp)
	message := "Password updated successfully!"

	c.JSON(http.StatusOK, gin.H{
		"message": message,
	})

}

func PostEvent(c *gin.Context) {
	var postEvents models.Event
	if err := c.ShouldBindJSON(&postEvents); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	userID, _ := c.Get("user_id")
	postEvents.UserID = userID.(uint)

	database.CreateEvent(postEvents)
	message := "'" + postEvents.EventName + "'" + " has been successfully saved !"

	c.JSON(http.StatusCreated, gin.H{
		"message": message,
	})
}

func GetEvents(c *gin.Context) {
	var getEvents []models.Event

	order := c.DefaultQuery("order", "newest")

	getEvents, err := database.ReadEvents(order)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "failed to fetch events",
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"events": getEvents,
	})
}

func GetEventByID(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
		return
	}
	eventID := uint(idInt)

	var event models.Event
	event = database.ReadEvent(eventID)
	c.JSON(http.StatusOK, event)
}

func EditEvent(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
		return
	}
	eventID := uint(idInt)

	var input models.EventUpdate
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	input.ID = eventID
	newEvent := input.EventName

	var event models.Event
	event = database.ReadEvent(eventID)
	oldEvent := event.EventName

	database.UpdateEvent(input)

	message := "'" + oldEvent + "'" + " has been successfully updated to " + "'" + newEvent + "' !"
	c.JSON(http.StatusOK, gin.H{
		"message": message,
	})
}

func DeleteEvent(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
		return
	}
	eventID := uint(idInt)

	event := database.ReadEvent(eventID)
	delEvent := event.EventName

	database.DeleteEvent(eventID)
	message := "'" + delEvent + "'" + " has been successfully deleted !"
	c.JSON(http.StatusOK, gin.H{
		"message": message,
	})
}

func GetCompanies(c *gin.Context) {
	var getCompanies []models.Company
	getCompanies = database.ReadCompanies()
	c.JSON(http.StatusOK, gin.H{
		"companies": getCompanies,
	})
}

func GetCompanyById(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
		return
	}
	companyID := uint(idInt)

	var company models.Company
	company = database.ReadCompany(companyID)
	c.JSON(http.StatusOK, gin.H{
		"company": company,
	})
}

func PostCompany(c *gin.Context) {
	var postCompany models.Company
	if err := c.ShouldBindJSON(&postCompany); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	userIDRaw, exists := c.Get("user_id")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "unauthorized"})
		return
	}

	idUint := userIDRaw.(uint)
	idStr := strconv.FormatUint(uint64(idUint), 10)

	postCompany.UserID = idUint
	postCompany.EditedBy = idStr

	database.CreateCompany(postCompany)
	message := "'" + postCompany.CompanyName + "'" + " has been successfully created !"
	c.JSON(http.StatusCreated, gin.H{
		"message": message,
	})

}

func EditCompany(c *gin.Context) {
	userIDRaw, exists := c.Get("user_id")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "unauthorized"})
		return
	}

	idUint := userIDRaw.(uint)
	idStr := strconv.FormatUint(uint64(idUint), 10)

	var input models.CompanyUpdate
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid request body",
		})
	}

	input.EditedBy = idStr
	database.UpdateCompany(input)

	message := "'" + input.CompanyName + "'" + " has been successfully edited !"
	c.JSON(http.StatusOK, gin.H{
		"message": message,
	})
}
func DeleteCompany(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
		return
	}
	companyID := uint(idInt)

	company := database.ReadCompany(companyID)
	delCompany := company.CompanyName

	database.DeleteCompany(companyID)
	message := "'" + delCompany + "'" + " has been successfully deleted !"
	c.JSON(http.StatusOK, gin.H{
		"message": message,
	})
}

func PostContact(c *gin.Context) {
	var postContacts models.Contact
	if err := c.ShouldBindJSON(&postContacts); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	userIDRaw, exists := c.Get("user_id")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "unauthorized"})
		return
	}

	idUint := userIDRaw.(uint)
	idStr := strconv.FormatUint(uint64(idUint), 10)

	postContacts.UserID = idUint
	postContacts.EditedBy = idStr
	firstName := postContacts.FirstName
	lastName := postContacts.LastName

	database.CreateContact(postContacts)
	message := "'" + firstName + " " + lastName + "'" + " has been successfully saved !"
	c.JSON(http.StatusCreated, gin.H{
		"message": message,
	})
}

func GetContacts(c *gin.Context) {
	var getContacts []models.Contact

	order := c.DefaultQuery("order", "first_name_asc")
	getContacts, err := database.ReadContacts(order)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "failed to fetch events",
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"contacts": getContacts,
	})
}

func GetContactsByCompany(c *gin.Context) {
	companyID := c.Param("id")
	var contacts []models.Contact
	contacts = database.ReadContactsByCompany(companyID)
	c.JSON(http.StatusOK, gin.H{
		"data": contacts,
	})
}

func GetContactById(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
		return
	}
	contactID := uint(idInt)

	var contact models.Contact
	contact = database.ReadContact(contactID)
	c.JSON(http.StatusOK, contact)
}

func EditContact(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
		return
	}
	contactID := uint(idInt)

	userIDRaw, exists := c.Get("user_id")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "unauthorized"})
		return
	}

	idUint := userIDRaw.(uint)
	userID := strconv.FormatUint(uint64(idUint), 10)

	var input models.ContactUpdate
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	firstName := input.FirstName
	lastName := input.LastName

	input.ID = contactID
	input.EditedBy = userID

	database.UpdateContact(input)

	message := "'" + firstName + " " + lastName + "'" + " has been successfully updated !"
	c.JSON(http.StatusOK, gin.H{
		"message": message,
	})
}

func DeleteContact(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
		return
	}
	contactID := uint(idInt)
	var contact models.Contact
	contact = database.ReadContact(contactID)
	firstName := contact.FirstName
	lastName := contact.LastName

	database.DeleteContact(contactID)
	message := "'" + firstName + " " + lastName + "'" + " has been successfully deleted !"
	c.JSON(http.StatusOK, gin.H{
		"message": message,
	})
}

func GetNotes(c *gin.Context) {
	var getNotes []models.Note
	getNotes = database.ReadNotes()
	userID, _ := c.Get("user_id")
	fmt.Println(userID)

	c.JSON(http.StatusOK, getNotes)
}

func GetNoteByID(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
		return
	}
	noteID := uint(idInt)

	var note models.Note
	note = database.ReadNote(noteID)

	c.JSON(http.StatusOK, gin.H{
		"note": note,
	})
}

func GetUserNotes(c *gin.Context) {
	var getUserNotes []models.Note
	userID, _ := c.Get("user_id")
	userRole, _ := c.Get("role")

	switch userRole {
	case "admin":
		getUserNotes = database.ReadNotes()
	case "user":
		getUserNotes = database.ReadUserNotes(userID.(uint))
	}

	c.JSON(http.StatusOK, gin.H{
		"getUserNotes": getUserNotes,
	})
}

func GetNotesByCompany(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
		return
	}
	idUint := uint(idInt)

	var notes []models.Note
	notes = database.ReadNotesByCompany(idUint)
	c.JSON(http.StatusOK, gin.H{
		"notes": notes,
	})
}

func PostNotes(c *gin.Context) {
	var postNotes models.Note
	if err := c.ShouldBindJSON(&postNotes); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	userIDRaw, exists := c.Get("user_id")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "unauthorized"})
		return
	}

	idUint := userIDRaw.(uint)
	postNotes.UserID = idUint

	database.CreateNote(postNotes)
	message := "Notes successfully created !"
	c.JSON(http.StatusCreated, gin.H{
		"message": message,
	})
}

func EditNote(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ID"})
		return
	}
	idUint := uint(idInt)

	var note models.NoteUpdate
	if err := c.ShouldBindJSON(&note); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}
	note.ID = idUint

	database.UpdateNote(note)
	message := "Note successfully updated"
	c.JSON(http.StatusOK, gin.H{
		"message": message,
	})
}

func DeleteNote(c *gin.Context) {
	idParam := c.Param("id")
	idInt, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid request body",
		})
		return
	}
	idUint := uint(idInt)

	var deletedNote models.Note
	deletedNote = database.ReadNote(idUint)

	database.DeleteNote(idUint)
	message := "'" + deletedNote.Title + "'" + " has been successfully deleted !"
	c.JSON(http.StatusOK, gin.H{
		"message": message,
	})

}

func LogoutHandler(c *gin.Context) {
	session := sessions.Default(c)
	session.Clear()
	session.Save()

	c.JSON(200, gin.H{
		"message": "logout success",
	})
}

func MigrateOldNotes(c *gin.Context) {
	var notes []models.Note

	notes = database.ReadNotes()

	count := 0

	for _, note := range notes {
		newBody := normalizeNoteHTML(note.Body)

		note.Body = newBody

		database.MigrateNotes(note)

		count++
	}

	c.JSON(200, gin.H{
		"message": "Migration completed",
		"updated": count,
	})
}

func MigrateOldCompanies(c *gin.Context) {
	var companies []models.Company

	companies = database.ReadCompanies()

	count := 0

	for _, company := range companies {
		newNote := normalizeNoteHTML(company.CompanyNotes)

		company.CompanyNotes = newNote

		database.MigrateCompanies(company)

		count++
	}

	c.JSON(200, gin.H{
		"message": "Migration completed",
		"updated": count,
	})
}

func normalizeNoteHTML(old string) string {
	s := strings.TrimSpace(old)

	// Ganti &nbsp;
	s = strings.ReplaceAll(s, "&nbsp;", " ")
	s = strings.ReplaceAll(s, "<div>", "<p>")
	s = strings.ReplaceAll(s, "</div>", "</p>")
	s = strings.ReplaceAll(s, "<br>", "</p><p>")

	return s
}

func ForgotPassword(c *gin.Context) {
	var input models.PasswordReset
	var req struct {
		Email string `json:"email"`
	}

	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(400, gin.H{"error": "Invalid request"})
		return
	}

	token := uuid.New().String()
	expiredAt := time.Now().Add(15 * time.Minute)

	input.Email = "ngurah@icstravelgroup.com"
	input.Token = token
	input.ExpiredAt = expiredAt

	database.CreatePasswordReset(input)

	resetLink := "http://localhost:5173/reset-password?token=" + token

	sendResetEmail(input.Email, resetLink)

	c.JSON(200, gin.H{
		"message": "Reset password link sent to your email",
	})
}

func sendResetEmail(to, link string) {
	m := gomail.NewMessage()
	m.SetHeader("From", "ICS Notes <notes.ics.api@gmail.com>")
	m.SetHeader("To", to)
	m.SetHeader("Subject", "Reset Password")
	m.SetBody("text/html", `
        <p>Please use the link below to reset your password:</p>
        <a href="`+link+`">Reset Password</a>
        <p>The link is valid for 15 minutes.</p>
    `)

	d := gomail.NewDialer(
		"smtp.gmail.com",
		587,
		"notes.ics.api@gmail.com",
		"ogzvzckordqebrcd",
	)

	d.DialAndSend(m)
}

func ResetPassword(c *gin.Context) {
	var input models.FormResetPasswordViaEmail
	var passwordReset models.PasswordReset
	var userUpdate models.UserUpdate

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(400, gin.H{"error": "Invalid request"})
		return
	}

	passwordReset, err := database.ReadPasswordReset(input)

	if err != nil {
		c.JSON(400, gin.H{"error": "Token invalid or expired"})
		return
	}

	hashedPassword, _ := bcrypt.GenerateFromPassword([]byte(input.Password), bcrypt.DefaultCost)

	userUpdate.Email = passwordReset.Email
	userUpdate.Password = string(hashedPassword)

	database.UpdateUser(userUpdate)

	database.DeletePasswordResetByToken(input.Token)

	c.JSON(200, gin.H{"message": "Password successfully reset"})
}
