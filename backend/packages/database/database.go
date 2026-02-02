package database

import (
	"github.com/ignratnan/ics-notes.com/backend/models"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var db *gorm.DB

func ConnectDB() {

	/*
		dsn := "host=localhost user=postgres password=jkfd90-= dbname=icsnotes port=5432 sslmode=disable"
		var err error
		db, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
		if err != nil {
			panic("Failed to connect to database!")
		}
	*/

	//dsn := "ngurah:jkfd90-=@tcp(127.0.0.1:3306)/ics_notes_db?charset=utf8mb4&parseTime=True&loc=Local"

	dsn := "root:jkfd90-=@tcp(127.0.0.1:3306)/if0_35983749_icsnotes?charset=utf8mb4&parseTime=True&loc=Local"

	var err error
	db, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("Failed to connect to database!")
	}

}

func CreateAdmin(admin models.Admin) {
	var createAdmin models.Admin
	createAdmin = admin
	db.Create(&createAdmin)
}

func ReadAdmins() []models.Admin {
	var readAdmins []models.Admin
	db.Find(&readAdmins)
	return readAdmins
}

func ReadAdmin(adminID uint) models.Admin {
	var readAdmin models.Admin
	db.First(&readAdmin, adminID)
	return readAdmin
}

func UpdateAdmin(admin models.Admin) {
	var updateAdmin models.Admin
	updateAdmin = admin
	db.Save(&updateAdmin)
}

func DeleteAdmin(adminID string) {
	var deleteAdmin string
	deleteAdmin = adminID
	db.Delete(&models.Admin{}, deleteAdmin)
}

func CountAdmins() int64 {
	var countAdmins int64
	db.Model(&models.Admin{}).Count(&countAdmins)
	return countAdmins
}

func CreateUser(user models.User) {
	var createUser models.User
	createUser = user
	db.Create(&createUser)
}

func ReadUsers() []models.User {
	var readUsers []models.User
	db.Find(&readUsers)
	return readUsers
}

func UpdateUser(user models.UserUpdate) {
	var updateUser models.UserUpdate
	updateUser = user

	db.Model(&models.User{}).
		Where("email = ?", updateUser.Email).
		Updates(map[string]interface{}{
			"password": updateUser.Password,
		})
}

func DeleteUser(userID string) {
	var deleteUser string
	deleteUser = userID
	db.Delete(&models.User{}, deleteUser)
}

func CountUsers() int64 {
	var countUsers int64
	db.Model(&models.User{}).Count(&countUsers)
	return countUsers
}

func ReadUser(userID uint) models.User {
	var readUser models.User
	db.First(&readUser, userID)
	return readUser
}

func CreateCompany(company models.Company) {
	var createCompany models.Company
	createCompany = company
	db.Create(&createCompany)
}

func ReadCompanies() []models.Company {
	var readCompanies []models.Company
	db.Preload("User").Order("company_name asc").Find(&readCompanies)
	return readCompanies
}

func UpdateCompany(company models.CompanyUpdate) {
	var updateCompany models.CompanyUpdate
	updateCompany = company

	db.Model(&models.Company{}).
		Where("id = ?", updateCompany.ID).
		Updates(map[string]interface{}{
			"company_name":    updateCompany.CompanyName,
			"agent_type":      updateCompany.AgentType,
			"business_source": updateCompany.BusinessSource,
			"company_country": updateCompany.CompanyCountry,
			"company_notes":   updateCompany.CompanyNotes,
			"edited_by":       updateCompany.EditedBy,
		})
}

func DeleteCompany(companyID uint) {
	var deleteCompany uint
	deleteCompany = companyID
	db.Delete(&models.Company{}, deleteCompany)
}

func CountCompanies() int64 {
	var countCompanies int64
	db.Model(&models.Company{}).Count(&countCompanies)
	return countCompanies
}

func ReadCompany(companyID uint) models.Company {
	var readCompany models.Company
	db.Preload("User").First(&readCompany, companyID)
	return readCompany
}

func CreateContact(contact models.Contact) {
	var createContact models.Contact
	createContact = contact
	db.Create(&createContact)
}

func ReadContacts(order string) ([]models.Contact, error) {
	var readContacts []models.Contact
	query := db.Preload("User").Preload("Company")

	switch order {
	case "oldest":
		query = query.Order("created_at ASC")
	case "newest":
		query = query.Order("created_at DESC")
	case "first_name_desc":
		query = query.Order("first_name DESC")
	default:
		query = query.Order("first_name ASC")
	}

	if err := query.Find(&readContacts).Error; err != nil {
		return nil, err
	}

	return readContacts, nil
}

func UpdateContact(contact models.ContactUpdate) {
	var updateContact models.ContactUpdate
	updateContact = contact

	db.Model(&models.Contact{}).
		Where("id = ?", updateContact.ID).
		Updates(map[string]interface{}{
			"company_id":     updateContact.CompanyID,
			"contact_gender": updateContact.ContactGender,
			"first_name":     updateContact.FirstName,
			"last_name":      updateContact.LastName,
			"title":          updateContact.Title,
			"phone_number":   updateContact.PhoneNumber,
			"email":          updateContact.Email,
			"edited_by":      updateContact.EditedBy,
		})

}

func DeleteContact(contactID uint) {
	var deleteContact uint
	deleteContact = contactID
	db.Delete(&models.Contact{}, deleteContact)
}

func CountContacts() int64 {
	var countContacts int64
	db.Model(&models.Contact{}).Count(&countContacts)
	return countContacts
}

func ReadContact(contactID uint) models.Contact {
	var readContact models.Contact
	db.Preload("User").Preload("Company").First(&readContact, contactID)
	return readContact
}

func ReadContactsByCompany(companyID string) []models.Contact {
	var readContactsByCompany []models.Contact
	db.Preload("User").Preload("Company").Where("company_id = ?", companyID).Order("first_name").Find(&readContactsByCompany)
	return readContactsByCompany
}

func CreateEvent(event models.Event) {
	var createEvent models.Event
	createEvent = event
	db.Create(&createEvent)
}

func ReadEvents(order string) ([]models.Event, error) {
	var readEvents []models.Event
	query := db.Preload("User")

	switch order {
	case "oldest":
		query = query.Order("created_at ASC")
	case "event_name_asc":
		query = query.Order("event_name ASC")
	case "event_name_desc":
		query = query.Order("event_name DESC")
	default:
		query = query.Order("created_at DESC")
	}

	if err := query.Find(&readEvents).Error; err != nil {
		return nil, err
	}

	return readEvents, nil
}

func UpdateEvent(event models.EventUpdate) {
	var updateEvent models.EventUpdate
	updateEvent = event

	db.Model(&models.Event{}).
		Where("id = ?", updateEvent.ID).
		Update("event_name", updateEvent.EventName)
}

func DeleteEvent(eventID uint) {
	var deleteEvent uint
	deleteEvent = eventID
	db.Delete(&models.Event{}, deleteEvent)
}

func CountEvents() int64 {
	var countEvents int64
	db.Model(&models.Event{}).Count(&countEvents)
	return countEvents
}

func ReadEvent(eventID uint) models.Event {
	var readEvent models.Event
	db.Preload("User").First(&readEvent, eventID)
	return readEvent
}

func CreateNote(note models.Note) {
	var createNote models.Note
	createNote = note
	db.Create(&createNote)
}

func ReadNotes() []models.Note {
	var readNotes []models.Note
	db.Preload("User").Preload("Company").Preload("Contact").Preload("Event").Find(&readNotes)
	return readNotes
}

func ReadUserNotes(userID uint) []models.Note {
	var readUserNotes []models.Note
	db.Preload("User").Preload("Company").Preload("Contact").Preload("Event").Where("user_id = ?", userID).Order("created_at DESC").Find(&readUserNotes)
	return readUserNotes
}

func ReadNotesByCompany(companyID uint) []models.Note {
	var readNotesByCompany []models.Note
	db.Preload("User").Preload("Company").Preload("Contact").Preload("Event").Where("company_id = ?", companyID).Order("created_at DESC").Find(&readNotesByCompany)
	return readNotesByCompany
}

func UpdateNote(note models.NoteUpdate) {
	var updateNote models.NoteUpdate
	updateNote = note

	db.Model(&models.Note{}).
		Where("id = ?", updateNote.ID).
		Updates(map[string]interface{}{
			"contact_id": updateNote.ContactID,
			"event_id":   updateNote.EventID,
			"company_id": updateNote.CompanyID,
			"title":      updateNote.Title,
			"body":       updateNote.Body,
		})

}

func DeleteNote(noteID uint) {
	var deleteNote uint
	deleteNote = noteID
	db.Delete(&models.Note{}, deleteNote)
}

func CountNotes() int64 {
	var countNotes int64
	db.Model(&models.Note{}).Count(&countNotes)
	return countNotes
}

func ReadNote(noteID uint) models.Note {
	var readNote models.Note
	db.Preload("User").Preload("Company").Preload("Contact").Preload("Event").First(&readNote, noteID)
	return readNote
}

func MigrateNotes(note models.Note) {
	var updateNote models.Note
	updateNote = note

	db.Model(&models.Note{}).
		Where("id = ?", updateNote.ID).
		Updates(map[string]interface{}{
			"body": updateNote.Body,
		})

}

func MigrateCompanies(company models.Company) {
	var updateCompany models.Company
	updateCompany = company

	db.Model(&models.Company{}).
		Where("id = ?", updateCompany.ID).
		Updates(map[string]interface{}{
			"company_notes": updateCompany.CompanyNotes,
		})

}

func CreateSession(session models.Session) {
	var createSession models.Session
	createSession = session
	db.Create(&createSession)
}

func ReadSessions() []models.Session {
	var readSessions []models.Session
	db.Find(&readSessions)
	return readSessions
}

func UpdateSession(session models.Session) {
	var updateSession models.Session
	updateSession = session
	db.Save(&updateSession)
}

func DeleteSession(sessionID string) {
	var deleteSession string
	deleteSession = sessionID
	db.Delete(&models.Session{}, deleteSession)
}

func CreatePasswordReset(input models.PasswordReset) {
	var passwordReset models.PasswordReset
	passwordReset = input
	db.Create(&passwordReset)
}
