// Package routes contains the route handlers for the Planktoscope Live server.
package routes

import (
	"github.com/sargassum-world/fluitans/pkg/godest"
	"github.com/sargassum-world/fluitans/pkg/godest/turbostreams"

	"github.com/sargassum-world/pslive/internal/app/pslive/client"
	"github.com/sargassum-world/pslive/internal/app/pslive/routes/assets"
	"github.com/sargassum-world/pslive/internal/app/pslive/routes/auth"
	"github.com/sargassum-world/pslive/internal/app/pslive/routes/cable"
	"github.com/sargassum-world/pslive/internal/app/pslive/routes/home"
	"github.com/sargassum-world/pslive/internal/app/pslive/routes/instruments"
)

type Handlers struct {
	r       godest.TemplateRenderer
	globals *client.Globals
}

func New(r godest.TemplateRenderer, globals *client.Globals) *Handlers {
	return &Handlers{
		r:       r,
		globals: globals,
	}
}

func (h *Handlers) Register(er godest.EchoRouter, tsr turbostreams.Router, em godest.Embeds) {
	acc := h.globals.ACCancellers
	ss := h.globals.Sessions

	assets.RegisterStatic(er, em)
	assets.NewTemplated(h.r).Register(er)
	cable.New(
		h.r, ss, h.globals.CSRFChecker, acc, h.globals.TSSigner, h.globals.TSBroker, h.globals.Logger,
	).Register(er)
	home.New(h.r).Register(er, ss)
	auth.New(h.r, ss, acc, h.globals.Authn).Register(er)
	instruments.New(
		h.r, h.globals.TSBroker.Hub(), h.globals.Instruments, h.globals.Planktoscopes,
	).Register(er, tsr, ss)
}
