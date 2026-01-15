package request

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
	"github.com/ignratnan/ics-notes.com/backend/models"
	"github.com/ignratnan/ics-notes.com/backend/packages/database"
)

func GetUsers(c *gin.Context) {
	var getUsers []models.User
	getUsers = database.ReadUsers()
	c.JSON(http.StatusOK, getUsers)
}

func GetUserMe(c *gin.Context) {
	var getMe models.User
	userID, _ := c.Get("user_id")
	getMe = database.ReadUserMe(userID.(uint))
	c.JSON(http.StatusOK, gin.H{
		"userMe": getMe,
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
	c.JSON(http.StatusOK, getCompanies)
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
	companyID := c.Param("company_id")
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

func GetUserNotes(c *gin.Context) {
	var getUserNotes []models.Note
	userID, _ := c.Get("user_id")
	getUserNotes = database.ReadUserNotes(userID.(uint))
	c.JSON(http.StatusOK, gin.H{
		"getUserNotes": getUserNotes,
		"userID":       userID,
	})
}

func PostNotes(c *gin.Context) {
	var postNotes models.Note
	if err := c.ShouldBindJSON(&postNotes); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}
	database.CreateNote(postNotes)
	c.JSON(http.StatusCreated, gin.H{"message": "Post saved successfully!"})
}

func LogoutHandler(c *gin.Context) {
	session := sessions.Default(c)
	session.Clear()
	session.Save()

	c.JSON(200, gin.H{
		"message": "logout success",
	})
}
