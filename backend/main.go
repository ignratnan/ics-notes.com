package main

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-contrib/sessions/cookie"
	"github.com/gin-gonic/gin"

	"github.com/gin-contrib/sessions"
	"github.com/ignratnan/ics-notes.com/backend/packages/auth"
	"github.com/ignratnan/ics-notes.com/backend/packages/database"
	"github.com/ignratnan/ics-notes.com/backend/packages/middleware"
	"github.com/ignratnan/ics-notes.com/backend/packages/request"
)

func main() {
	database.ConnectDB()

	r := gin.Default()
	store := cookie.NewStore([]byte("secret-key-yg-sangat-rahasia"))

	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"http://localhost:5173"},
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE"},
		AllowHeaders:     []string{"Origin", "Content-Type"},
		AllowCredentials: true,
	}))

	r.Use(sessions.Sessions("mysession", store))
	//r.Use(cors.Default())

	auth.AdminCheck()

	r.POST("/login", auth.Login)

	protected := r.Group("/")
	protected.Use(middleware.AuthRequired())
	{
		protected.GET("/me", request.GetUserMe)
		protected.GET("/notes", request.GetUserNotes)
		protected.POST("/notes", request.PostNotes)
		protected.GET("/events", request.GetEvents)
		protected.GET("/events/:id", request.GetEventByID)
		protected.GET("/contacts", request.GetContacts)
		protected.GET("contacts/:id", request.GetContactById)
		protected.GET("/contacts/company/:id", request.GetContactsByCompany)
		protected.POST("/contacts", request.PostContact)
		protected.PUT("/contacts/:id", request.EditContact)
		protected.DELETE("/contacts/:id", request.DeleteContact)
		protected.GET("/companies", request.GetCompanies)
		protected.GET("/companies/:id", request.GetCompanyById)
		protected.POST("/companies", request.PostCompany)
		protected.PUT("/companies", request.EditCompany)
		protected.DELETE("/companies/:id", request.DeleteCompany)
		protected.GET("/events/create-event", request.GetEvents)
		protected.POST("/events", request.PostEvent)
		protected.PUT("/events/:id", request.EditEvent)
		protected.DELETE("/events/:id", request.DeleteEvent)
		protected.POST("/logout", request.LogoutHandler)
	}

	r.Run(":8080") // Run on http://localhost:8080

}
