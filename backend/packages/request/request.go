package request

import (
	"encoding/csv"
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
	var order string
	order = c.DefaultQuery("order", "newest")
	getCompanies, err := database.ReadCompanies(order)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "failed to get companies",
		})
		return
	}
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

	order := c.DefaultQuery("order", "newest")
	getContacts, err := database.ReadContacts(order)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "failed to fetch contacts",
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
	var order string
	var err error
	order = c.DefaultQuery("order", "newest")
	getNotes, err = database.ReadNotes(order)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Internal Server Error",
		})
		return
	}

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
	var order string
	var err error
	order = c.DefaultQuery("order", "newest")
	switch userRole {
	case "admin":
		getUserNotes, err = database.ReadNotes(order)
	case "user":
		getUserNotes, err = database.ReadUserNotes(order, userID.(uint))
	}

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Internal Server Error",
		})
		return
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

	userID, _ := c.Get("user_id")
	userRole, _ := c.Get("role")

	var notes []models.Note

	switch userRole {
	case "admin":
		notes = database.ReadNotesByCompany(idUint)
	case "user":
		notes = database.ReadUserNotesByCompany(userID.(uint), idUint)
	}

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
	var order string
	var err error
	order = c.DefaultQuery("order", "newest")
	notes, err = database.ReadNotes(order)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Internal Server Error",
		})
		return
	}

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
	var order string

	order = "company_name ASC"
	companies, err := database.ReadCompanies(order)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "failed to get companies",
		})
		return
	}

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

	isExists, err := database.IsEmailExists(req.Email)
	if err != nil {
		c.JSON(500, gin.H{"error": "Database error"})
		return
	}

	if !isExists {
		c.JSON(200, gin.H{
			"message": "Reset password link sent to your email",
		})
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

func ExportContactsCSV(c *gin.Context) {
	var contacts []models.Contact
	var order string
	order = "first_name_asc"

	contacts, err := database.ReadContacts(order)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Failed to fetch contacts",
		})
		return
	}

	// Set header agar browser download file
	filename := "contacts_" + time.Now().Format("20060102_150405") + ".csv"
	c.Header("Content-Type", "text/csv")
	c.Header("Content-Disposition", `attachment; filename="`+filename+`"`)
	c.Header("Cache-Control", "no-cache")

	// UTF-8 BOM (WAJIB untuk Excel)
	c.Writer.Write([]byte("\xEF\xBB\xBF"))

	writer := csv.NewWriter(c.Writer)
	defer writer.Flush()

	// =====================
	// CSV HEADER
	// =====================
	writer.Write([]string{
		"No",
		"Full Name",
		"Title",
		"Company",
		"Phone",
		"Email",
		"Created At",
	})

	// =====================
	// CSV ROWS
	// =====================
	number := 1
	for _, contact := range contacts {
		gender := ""
		if contact.ContactGender != "" {
			gender = "(" + contact.ContactGender + ")"
		}
		first_name := ""
		if contact.FirstName != "" {
			first_name = contact.FirstName
		}
		last_name := ""
		if contact.LastName != "" {
			last_name = contact.LastName
		}
		full_name := first_name + " " + last_name + " " + gender

		company_name := ""
		if contact.Company.CompanyName != "" {
			company_name = contact.Company.CompanyName
		}
		title := ""
		if contact.Title != "" {
			title = contact.Title
		}
		phone_number := ""
		if contact.PhoneNumber != "" {
			phone_number = fmt.Sprintf(`="%s"`, contact.PhoneNumber)
		}
		email := ""
		if contact.Email != "" {
			email = contact.Email
		}

		writer.Write([]string{
			fmt.Sprint(number),
			full_name,
			title,
			company_name,
			phone_number,
			email,
			contact.CreatedAt.Format("2006-01-02"),
		})

		number++
	}
}

func ExportCompaniesCSV(c *gin.Context) {
	var companies []models.Company
	var order string
	order = "company_name_asc"

	companies, err := database.ReadCompanies(order)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Failed to fetch contacts",
		})
		return
	}

	// Set header agar browser download file
	filename := "companies_" + time.Now().Format("20060102_150405") + ".csv"
	c.Header("Content-Type", "text/csv")
	c.Header("Content-Disposition", `attachment; filename="`+filename+`"`)
	c.Header("Cache-Control", "no-cache")

	// UTF-8 BOM (WAJIB untuk Excel)
	c.Writer.Write([]byte("\xEF\xBB\xBF"))

	writer := csv.NewWriter(c.Writer)
	defer writer.Flush()

	// =====================
	// CSV HEADER
	// =====================
	writer.Write([]string{
		"No",
		"Company Name",
		"Country",
		"Agent Type",
		"Business Source",
		"Created At",
	})

	// =====================
	// CSV ROWS
	// =====================
	number := 1
	for _, company := range companies {
		company_name := ""
		if company.CompanyName != "" {
			company_name = company.CompanyName
		}
		company_country := ""
		if company.CompanyCountry != "" {
			company_country = company.CompanyCountry
		}
		agent_type := ""
		if company.AgentType != "" {
			agent_type = company.AgentType
		}

		business_source := ""
		if company.BusinessSource != "" {
			business_source = company.BusinessSource
		}

		writer.Write([]string{
			fmt.Sprint(number),
			company_name,
			company_country,
			agent_type,
			business_source,
			company.CreatedAt.Format("2006-01-02"),
		})

		number++
	}
}

func GetDashboard(c *gin.Context) {
	var notes []models.Note
	var my_notes []models.Note
	var events []models.Event
	var companies []models.Company
	var contacts []models.Contact
	var notes_total int64
	var my_notes_total int64
	var events_total int64
	var companies_total int64
	var contacts_total int64

	var order string
	var limit int

	order = "newest"
	limit = 5

	userIDRaw, exists := c.Get("user_id")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "unauthorized"})
		return
	}

	idUint := userIDRaw.(uint)

	notes, notes_total, err := database.ReadNotesForDashboard(order, limit)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Internal Server Error",
		})
		return
	}

	my_notes, my_notes_total, err = database.ReadMyNotesForDashboard(idUint, order, limit)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Internal Server Error",
		})
		return
	}

	events, events_total, err = database.ReadEventsForDashboard(order, limit)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Internal Server Error",
		})
		return
	}

	companies, companies_total, err = database.ReadCompaniesForDashboard(order, limit)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Internal Server Error",
		})
		return
	}

	contacts, contacts_total, err = database.ReadContactsForDashboard(order, limit)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Internal Server Error",
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"notes":           notes,
		"my_notes":        my_notes,
		"events":          events,
		"companies":       companies,
		"contacts":        contacts,
		"notes_total":     notes_total,
		"my_notes_total":  my_notes_total,
		"events_total":    events_total,
		"companies_total": companies_total,
		"contacts_total":  contacts_total,
	})
}
