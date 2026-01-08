package request

import (
	"fmt"
	"net/http"

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

func PostEvent(c *gin.Context) {
	var postEvents models.Event
	if err := c.ShouldBindJSON(&postEvents); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}
	database.CreateEvent(postEvents)
	c.JSON(http.StatusCreated, gin.H{"message": "Post saved successfully!"})
}

func GetEvents(c *gin.Context) {
	var getEvents []models.Event
	getEvents = database.ReadEvents()
	c.JSON(http.StatusOK, getEvents)
}

func GetEventByID(c *gin.Context) {
	eventID := c.Param("id")
	var event models.Event
	event = database.ReadEvent(eventID)
	c.JSON(http.StatusOK, event)
}

func EditEvent(c *gin.Context) {
	eventID := c.Param("id")
	var input models.UpdateEventInput
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	var event models.Event
	event = database.ReadEvent(eventID)
	event.EventName = input.EventName
	database.UpdateEvent(event)
	c.JSON(http.StatusOK, gin.H{
		"message":  "Event updated successfully",
		"event_id": event.ID,
	})
}

func DeleteEvent(c *gin.Context) {
	eventID := c.Param("id")
	database.DeleteEvent(eventID)
	c.JSON(http.StatusOK, gin.H{"message": "Event deleted successfully"})
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
	database.CreateContact(postContacts)
	c.JSON(http.StatusCreated, gin.H{"message": "Post saved successfully!"})
}

func GetContacts(c *gin.Context) {
	var getContacts []models.Contact
	getContacts = database.ReadContacts()
	c.JSON(http.StatusOK, getContacts)
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
	contactID := c.Param("id")
	var contact models.Contact
	contact = database.ReadContact(contactID)
	c.JSON(http.StatusOK, contact)
}

func EditContact(c *gin.Context) {
	contactID := c.Param("id")
	var input models.Contact
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	var contact models.Contact
	contact = database.ReadContact(contactID)
	contact = input
	database.UpdateContact(contact)
	c.JSON(http.StatusOK, gin.H{
		"message":  "Contact updated successfully",
		"event_id": contact.ID,
	})
}

func DeleteContact(c *gin.Context) {
	contactID := c.Param("id")
	database.DeleteContact(contactID)
	c.JSON(http.StatusOK, gin.H{"message": "Contact deleted successfully"})
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
	c.JSON(http.StatusOK, getUserNotes)
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
