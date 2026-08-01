declare_loadout({
	category		 = CAT_FUEL_TANKS,
	CLSID			 = "{AT27_TANK}",
	attribute		 =  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},

	Picture			 = "ptb2.png",
	displayName		 = _("70 Imp gal (320 lit) external tank"),
	Weight_Empty	 = 40.8,
	Weight			 = 40.8 +  230.3,
	Cx_pil			 = 0.002,
	shape_table_data = 
	{
		{
			name 	= "AT27_TANK",
			file	= "AT27_TANK",
			life	= 1;
			fire	= { 0, 1};
			username	= "AT27_TANK";
			index	= WSTYPE_PLACEHOLDER;
		},
	},
	Elements	= 
	{
		{
			ShapeName	= "AT27_TANK",
		}, 
	}, 
})

------------------------------------------------------------------------------------------------------------
-- Smoke -- somente variante EMB312_T-27, montado no Pylon4 dedicado (comprovado seguro).
-- IMPORTANTE: Elements/shape_table_data sao OBRIGATORIOS para o motor do DCS aceitar um
-- declare_loadout de CAT_PODS -- testado e confirmado (removê-los quebra o carregamento do
-- banco de armas do jogo inteiro). Ficam apontando para "T27_SMOKE-POD"/"smoke_pod", que nao
-- existem como .edm real -- e por isso o pod ja fica INVISIVEL na pratica (nada pra renderizar),
-- sem precisar remover a tabela Elements. So o efeito de fumaca (campo Smoke) aparece.
------------------------------------------------------------------------------------------------------------

declare_loadout(
	{
		category		= CAT_PODS,
		CLSID			= "{SMOKE-WHITE-T27}",
		Picture	= "fumo.png",
		PictureBlendColor= '0xffffffff',
		displayName		= _("White Smoke"),

		attribute	=	{4,	15,	50,	WSTYPE_PLACEHOLDER},
		Smoke  = {
			alpha = 180,
			r  = 255,
			g  = 255,
			b  = 255,
			dx = -1.455,
			dy = -0.062
		},

		shape_table_data =
		{
			{
				name 	= "T27_SMOKE-POD",
				file	= "T27_SMOKE-POD";
				life	= 1;
				fire	= { 0, 1};
				username	= "SMOKE_WHITE_T27";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Weight			= 1,
		Count 			= 1,
		Cx_pil			= 0.0,
		Elements		={{
							ShapeName	=	"T27_SMOKE-POD",
							Position	=	{0,- 0.059317,0},
							DrawArgs	=	{[3] = {3,0.1}}
						}}
	}
)

declare_loadout(
	{
		category		= CAT_PODS,
		CLSID			= "{SMOKE-RED-T27}",
		Picture	= "fumo.png",
		PictureBlendColor= '0xc81e1eff',
		displayName		= _("Red Smoke"),

		attribute	=	{4,	15,	50,	WSTYPE_PLACEHOLDER},
		Smoke  = {
			alpha = 180,
			r  = 204,
			g  = 0,
			b  = 51,
			dx = -1.455,
			dy = -0.062
		},

		shape_table_data =
		{
			{
				name 	= "T27_SMOKE-POD",
				file	= "T27_SMOKE-POD";
				life	= 1;
				fire	= { 0, 1};
				username	= "SMOKE_RED_T27";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Weight			= 1,
		Count 			= 1,
		Cx_pil			= 0.0,
		Elements		={{
							ShapeName	=	"T27_SMOKE-POD",
							Position	=	{0,- 0.059317,0},
							DrawArgs	=	{[3] = {3,0.1}}
						}}
	}
)

declare_loadout(
	{
		category		= CAT_PODS,
		CLSID			= "{SMOKE-GREEN-T27}",
		Picture	= "fumo.png",
		PictureBlendColor= '0x228b22ff',
		displayName		= _("Green Smoke"),

		attribute	=	{4,	15,	50,	WSTYPE_PLACEHOLDER},
		Smoke  = {
			alpha = 180,
			r  = 34,
			g  = 139,
			b  = 34,
			dx = -1.455,
			dy = -0.062
		},

		shape_table_data =
		{
			{
				name 	= "T27_SMOKE-POD",
				file	= "T27_SMOKE-POD";
				life	= 1;
				fire	= { 0, 1};
				username	= "SMOKE_GREEN_T27";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Weight			= 1,
		Count 			= 1,
		Cx_pil			= 0.0,
		Elements		={{
							ShapeName	=	"T27_SMOKE-POD",
							Position	=	{0,- 0.059317,0},
							DrawArgs	=	{[3] = {3,0.1}}
						}}
	}
)

declare_loadout(
	{
		category		= CAT_PODS,
		CLSID			= "{SMOKE-BLACK-T27}",
		Picture	= "fumo.png",
		PictureBlendColor= '0x000000ff',
		displayName		= _("Black Smoke"),

		attribute	=	{4,	15,	50,	WSTYPE_PLACEHOLDER},
		Smoke  = {
			alpha = 100,
			r  = 0,
			g  = 0,
			b  = 20,
			dx = -1.455,
			dy = -0.062
		},

		shape_table_data =
		{
			{
				name 	= "T27_SMOKE-POD",
				file	= "T27_SMOKE-POD";
				life	= 1;
				fire	= { 0, 1};
				username	= "SMOKE_BLACK_T27";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Weight			= 1,
		Count 			= 1,
		Cx_pil			= 0.0,
		Elements		={{
							ShapeName	=	"T27_SMOKE-POD",
							Position	=	{0,- 0.059317,0},
							DrawArgs	=	{[3] = {3,0.1}}
						}}
	}
)

declare_loadout(
	{
		category		= CAT_PODS,
		CLSID			= "{SMOKE-ORANGE-T27}",
		Picture	= "fumo.png",
		PictureBlendColor= '0xfc9600ff',
		displayName		= _("Orange Smoke"),

		attribute		=	{4,	15,	50,	WSTYPE_PLACEHOLDER},
		Smoke  = {
			alpha = 180,
			r  = 255,
			g  = 108,
			b  = 0,
			dx = -1.455,
			dy = -0.062
		},

		shape_table_data =
		{
			{
				name 	= "smoke-pod",
				file	= "smoke_pod";
				life	= 1;
				fire	= { 0, 1};
				username	= "SMOKE_ORANGE_T27";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Weight			= 1,
		Count 			= 1,
		Cx_pil			= 0.0,
		Elements		={{
							ShapeName	=	"smoke_pod",
							Position	=	{0,- 0.059317,0},
							DrawArgs	=	{[3] = {3,0.1}}
						}}
	}
)

declare_loadout(
	{
		category		= CAT_PODS,
		CLSID			= "{SMOKE-YELLOW-T27}",
		Picture	= "fumo.png",
		PictureBlendColor= '0xffff00ff',
		displayName		= _("Yellow Smoke"),

		attribute		=	{4,	15,	50,	WSTYPE_PLACEHOLDER},
		Smoke  = {
			alpha = 180,
			r  = 255,
			g  = 218,
			b  = 0,
			dx = -1.455,
			dy = -0.062
		},

		shape_table_data =
		{
			{
				name 	= "smoke-pod",
				file	= "smoke_pod";
				life	= 1;
				fire	= { 0, 1};
				username	= "SMOKE_YELLOW_T27";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Weight			= 1,
		Count 			= 1,
		Cx_pil			= 0.0,
		Elements		={{
							ShapeName	=	"smoke_pod",
							Position	=	{0,- 0.059317,0},
							DrawArgs	=	{[3] = {3,0.1}}
						}}
	}
)