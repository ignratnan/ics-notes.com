package middleware

import (
	"net/http"

	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
)

func AuthRequired() gin.HandlerFunc {
	return func(c *gin.Context) {
		session := sessions.Default(c)
		userID := session.Get("user_id")
		userRole := session.Get("role")

		if userID == nil {
			c.JSON(http.StatusUnauthorized, gin.H{
				"message": "unauthorized",
			})
			c.Abort()
			return
		}

		// Simpan user_id ke context agar bisa dipakai handler lain
		c.Set("user_id", userID)
		c.Set("role", userRole)

		c.Next()
	}
}
