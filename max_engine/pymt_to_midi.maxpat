{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 690.0, 74.0, 502.0, 407.0 ],
		"bglocked" : 0,
		"defrect" : [ 690.0, 74.0, 502.0, 407.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b",
					"id" : "obj-2",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 42.0, 286.0, 24.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s midi",
					"id" : "obj-47",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 152.0, 339.0, 42.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 1",
					"id" : "obj-46",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 71.0, 262.0, 72.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"id" : "obj-19",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 11.595187,
					"types" : [  ],
					"patching_rect" : [ 71.0, 309.0, 180.0, 20.0 ],
					"numoutlets" : 3,
					"items" : [ "AU DLS Synth 1", ",", "from MaxMSP 1", ",", "from MaxMSP 2" ],
					"outlettype" : [ "int", "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiinfo",
					"id" : "obj-20",
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 11.595187,
					"patching_rect" : [ 71.0, 290.0, 48.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack i",
					"id" : "obj-42",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 137.0, 144.0, 55.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "match nn on nn",
					"id" : "obj-39",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 137.0, 113.0, 93.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s notes",
					"id" : "obj-31",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 298.0, 108.0, 49.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "note $1",
					"id" : "obj-29",
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"patching_rect" : [ 137.0, 174.0, 51.0, 18.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "poly~ pymt_to_midi_poly 5",
					"id" : "obj-27",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 137.0, 197.0, 153.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /note",
					"id" : "obj-4",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 137.0, 77.0, 68.0, 20.0 ],
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 4444",
					"id" : "obj-1",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 137.0, 43.0, 99.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 1 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 307.0, 96.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [ 51.0, 281.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [ 51.5, 309.0 ]
				}

			}
 ]
	}

}
