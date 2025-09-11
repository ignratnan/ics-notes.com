package models

import (
	"time"
)

// Model
type User struct {
	ID    uint   `json:"id" gorm:"primaryKey"`
	Name  string `json:"name"`
	Email string `json:"email"`
}

type Event struct {
	ID        uint      `json:"id" gorm:"primaryKey"`
	UserID    uint      `json:"user_id"`
	EventName string    `json:"event_name"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Contact struct {
	ID            uint      `json:"id" gorm:"primaryKey"`
	UserID        uint      `json:"user_id"`
	CompanyID     uint      `json:"company_id"`
	ContactGender string    `json:"contact_gender"`
	FirstName     string    `json:"first_name"`
	LastName      string    `json:"last_name"`
	Title         string    `json:"title"`
	PhoneNumber   string    `json:"phone_number"`
	Email         string    `json:"email"`
	EditedBy      string    `json:"edited_by"`
	CreatedAt     time.Time `json:"created_at"`
	UpdatedAt     time.Time `json:"updated_at"`
}
