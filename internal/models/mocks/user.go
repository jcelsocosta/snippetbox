package mocks

import (
	"snippetbox.jccl.net/internal/models"
)

type UserModel struct{}

func (m *UserModel) Insert(name string, email string, password string) error {
	switch email {
	case "dupe@example.com":
		return models.ErrDuplicatedEmail

	default:
		return nil
	}
}

func (m *UserModel) Authenticate(email string, password string) (int, error) {
	if email == "alice@example.com" && password == "pa$$word" {
		return 1, nil
	}

	return 0, models.ErrInvalidCredentials
}

func (m *UserModel) Exists(id int) (bool, error) {
	switch id {
	case 1:
		return true, nil
	default:
		return false, nil
	}
}
