package main

import (
	"net/http"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"

	"github.com/ignratnan/ics-notes.com/backend/models"
)

var db *gorm.DB

func connectDB() {
	dsn := "host=localhost user=postgres password=jkfd90-= dbname=icsnotes port=5432 sslmode=disable"
	var err error
	db, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("Failed to connect to database!")
	}

	db.AutoMigrate(&models.Event{})
}

func getEvents(c *gin.Context) {
	var events []models.Event
	db.Find(&events)
	c.JSON(http.StatusOK, events)
}

func main() {
	connectDB()

	r := gin.Default()

	// Enable CORS so Vue can access
	r.Use(cors.Default())

	r.GET("/events", getEvents)

	r.Run(":8080") // Run on http://localhost:8080

}
