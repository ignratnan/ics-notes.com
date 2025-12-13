package sessions

import (
	"strconv"
	"time"

	"github.com/ignratnan/ics-notes.com/backend/models"
	"github.com/ignratnan/ics-notes.com/backend/packages/database"
	"golang.org/x/crypto/bcrypt"
)

var Session models.Session

func Start(userID uint) {
	id := userID
	id64 := uint64(userID)
	idString := strconv.FormatUint(id64, 10)

	now := time.Now()
	layout := "2006-01-02 15:04:05"
	nowString := now.Format(layout)
	tomorrow := now.Add(time.Hour * 24)

	sessionRaw := idString + " " + nowString
	sessionHash, _ := hashSession(sessionRaw)

	Session.SessionID = sessionHash
	Session.UserID = id
	Session.SessionStart = now
	Session.SessionEnd = tomorrow

	database.AddSession(Session)
}

func hashSession(session string) (string, error) {
	bytes, err := bcrypt.GenerateFromPassword([]byte(session), bcrypt.DefaultCost)

	if err != nil {
		return "", err
	}

	return string(bytes), nil
}
