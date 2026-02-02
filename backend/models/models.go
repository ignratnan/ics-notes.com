package models

import (
	"time"
)

type Session struct {
	ID           uint      `json:"id" gorm:"primaryKey"`
	SessionID    string    `json:"session_id"`
	UserID       uint      `json:"user_id"`
	SessionStart time.Time `json:"session_start"`
	SessionEnd   time.Time `json:"session_end"`
}

// Model
type Admin struct {
	ID       uint   `json:"id" gorm:"primaryKey"`
	Role     string `json:"role"`
	Password string `json:"password"`
}

type User struct {
	ID                     uint      `json:"id" gorm:"primaryKey"`
	Name                   string    `json:"name"`
	Email                  string    `json:"email"`
	EmailVerifiedAt        time.Time `json:"email_verified_at"`
	Password               string    `json:"password"`
	TwoFactorSecret        string    `json:"two_factor_secret"`
	TwoFactorRecoveryCodes string    `json:"two_factor_recovery_codes"`
	TwoFactorConfirmedAt   time.Time `json:"two_factor_confirmed_at"`
	RememberToken          string    `json:"remember_token"`
	CurrentTeamID          uint      `json:"current_team_id"`
	ProfilePhotoPath       string    `json:"profile_photo_path"`
	CreatedAt              time.Time `json:"created_at"`
	UpdatedAt              time.Time `json:"updated_at"`
}

type Event struct {
	ID        uint      `json:"id" gorm:"primaryKey"`
	UserID    uint      `json:"user_id"`
	EventName string    `json:"event_name"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
	User      User      `json:"user" gorm:"foreignKey:UserID"`
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
	User          User      `json:"user" gorm:"foreignKey:UserID"`
	Company       Company   `json:"company" gorm:"foreignKey:CompanyID"`
}

type Company struct {
	ID             uint      `json:"id" gorm:"primaryKey"`
	UserID         uint      `json:"user_id"`
	CompanyName    string    `json:"company_name"`
	AgentType      string    `json:"agent_type"`
	BusinessSource string    `json:"business_source"`
	CompanyCountry string    `json:"company_country"`
	CompanyNotes   string    `json:"company_notes"`
	EditedBy       string    `json:"edited_by"`
	CreatedAt      time.Time `json:"created_at"`
	UpdatedAt      time.Time `json:"updated_at"`
	User           User      `json:"user" gorm:"foreignKey:UserID"`
}

type Note struct {
	ID        uint      `json:"id" gorm:"primaryKey"`
	UserID    uint      `json:"user_id"`
	ContactID uint      `json:"contact_id"`
	EventID   uint      `json:"event_id"`
	CompanyID uint      `json:"company_id"`
	Title     string    `json:"title"`
	Body      string    `json:"body" gorm:"type:text"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
	User      User      `json:"user" gorm:"foreignKey:UserID"`
	Contact   Contact   `json:"contact" gorm:"foreignKey:ContactID"`
	Event     Event     `json:"event" gorm:"foreignKey:EventID"`
	Company   Company   `json:"company" gorm:"foreignKey:CompanyID"`
}

type Team struct {
	ID           uint      `json:"id" gorm:"primaryKey"`
	UserID       uint      `json:"user_id"`
	Name         string    `json:"name"`
	PersonalTeam string    `json:"personal_tema"`
	CreatedAt    time.Time `json:"created_at"`
	UpdatedAt    time.Time `json:"updated_at"`
	User         User      `json:"user" gorm:"foreignKey:UserID"`
}

type LoginRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type EventUpdate struct {
	ID        uint   `json:"id"`
	EventName string `json:"event_name" binding:"required"`
}

type ContactUpdate struct {
	ID            uint   `json:"id" gorm:"primaryKey"`
	UserID        uint   `json:"user_id"`
	CompanyID     uint   `json:"company_id"`
	ContactGender string `json:"contact_gender"`
	FirstName     string `json:"first_name"`
	LastName      string `json:"last_name"`
	Title         string `json:"title"`
	PhoneNumber   string `json:"phone_number"`
	Email         string `json:"email"`
	EditedBy      string `json:"edited_by"`
}

type CompanyUpdate struct {
	ID             uint   `json:"id" gorm:"primaryKey"`
	UserID         uint   `json:"user_id"`
	CompanyName    string `json:"company_name"`
	AgentType      string `json:"agent_type"`
	BusinessSource string `json:"business_source"`
	CompanyCountry string `json:"company_country"`
	CompanyNotes   string `json:"company_notes"`
	EditedBy       string `json:"edited_by"`
}

type NoteUpdate struct {
	ID        uint   `json:"id" gorm:"primaryKey"`
	UserID    uint   `json:"user_id"`
	ContactID uint   `json:"contact_id"`
	EventID   uint   `json:"event_id"`
	CompanyID uint   `json:"company_id"`
	Title     string `json:"title"`
	Body      string `json:"body" gorm:"type:text"`
}

type UserUpdate struct {
	ID       uint   `json:"id" gorm:"primaryKey"`
	Name     string `json:"name"`
	Email    string `json:"email"`
	Password string `json:"password"`
}

type FormResetPassword struct {
	OldPassword     string `json:"old_password"`
	NewPassword     string `json:"new_password"`
	ConfirmPassword string `json:"confirm_password"`
}

type PasswordReset struct {
	ID        uint      `json:"id" gorm:"primaryKey"`
	Email     string    `json:"email"`
	Token     string    `json:"token"`
	ExpiredAt time.Time `json:"expired_at"`
	CreatedAt time.Time `json:"created_at"`
}
