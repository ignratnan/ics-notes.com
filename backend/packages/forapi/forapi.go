package forapi

import (
	"log"
	"net/http"
	"strconv"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

// Define the database connection string here.
// IMPORTANT: Replace the placeholders with your actual PostgreSQL credentials.
const dsn = "host=localhost port=5432 user=youruser password=yourpassword dbname=yourdbname sslmode=disable"

// Post represents the data for a blog post. GORM will use this struct to map to the database table.
type Post struct {
	ID        uint      `gorm:"primaryKey" json:"id"`
	Title     string    `gorm:"not null" json:"title" binding:"required"`
	Content   string    `gorm:"not null" json:"content" binding:"required"`
	CreatedAt time.Time `gorm:"autoCreateTime" json:"created_at"`
}

func forapi() {
	// Initialize Gin
	r := gin.Default()

	// Use CORS middleware to allow requests from the Vue frontend
	r.Use(cors.Default())

	// Connect to the PostgreSQL database using GORM
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatal("Failed to connect to database:", err)
	}

	// Auto-migrate the Post struct to create or update the 'posts' table
	err = db.AutoMigrate(&Post{})
	if err != nil {
		log.Fatal("Failed to auto-migrate database schema:", err)
	}
	log.Println("Successfully connected to the PostgreSQL database and migrated schema!")

	// Define the API endpoint for creating a new post
	r.POST("/api/posts", func(c *gin.Context) {
		var newPost Post
		if err := c.ShouldBindJSON(&newPost); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
			return
		}

		if result := db.Create(&newPost); result.Error != nil {
			log.Println("Error inserting new post:", result.Error)
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save post to database."})
			return
		}

		c.JSON(http.StatusCreated, gin.H{"message": "Post saved successfully!"})
	})

	// Define the API endpoint for getting all posts
	r.GET("/api/posts", func(c *gin.Context) {
		var posts []Post
		if result := db.Order("created_at desc").Find(&posts); result.Error != nil {
			log.Println("Error fetching posts:", result.Error)
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch posts."})
			return
		}
		c.JSON(http.StatusOK, gin.H{"posts": posts})
	})

	// Define the API endpoint for getting a single post by ID
	r.GET("/api/posts/:id", func(c *gin.Context) {
		idStr := c.Param("id")
		id, err := strconv.Atoi(idStr)
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid post ID"})
			return
		}

		var post Post
		if result := db.First(&post, id); result.Error != nil {
			if result.Error == gorm.ErrRecordNotFound {
				c.JSON(http.StatusNotFound, gin.H{"error": "Post not found."})
			} else {
				log.Println("Error fetching single post:", result.Error)
				c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch post."})
			}
			return
		}
		c.JSON(http.StatusOK, gin.H{"post": post})
	})

	// Define the API endpoint for updating a post
	r.PUT("/api/posts/:id", func(c *gin.Context) {
		idStr := c.Param("id")
		id, err := strconv.Atoi(idStr)
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid post ID"})
			return
		}

		var updatedPost Post
		if err := c.ShouldBindJSON(&updatedPost); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
			return
		}

		result := db.Model(&Post{}).Where("id = ?", id).Updates(&updatedPost)
		if result.Error != nil {
			log.Println("Error updating post:", result.Error)
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update post."})
			return
		}
		if result.RowsAffected == 0 {
			c.JSON(http.StatusNotFound, gin.H{"error": "Post not found."})
			return
		}

		c.JSON(http.StatusOK, gin.H{"message": "Post updated successfully!"})
	})
}
