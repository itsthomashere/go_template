package usecase

import "sw_analytic/internal/pkg/domain/interfaces"

type usecaseImpl struct{}

func NewUsecase() interfaces.SampleUsecase {
	return &usecaseImpl{}
}
