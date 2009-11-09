{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 64.0, 71.0, 533.0, 409.0 ],
		"bglocked" : 0,
		"defrect" : [ 64.0, 71.0, 533.0, 409.0 ],
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
					"text" : "t i i 1 1 63",
					"id" : "obj-11",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 284.0, 53.0, 73.0, 20.0 ],
					"numoutlets" : 5,
					"outlettype" : [ "int", "int", "int", "int", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"id" : "obj-19",
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"patching_rect" : [ 340.0, 322.0, 34.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"id" : "obj-10",
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"patching_rect" : [ 190.0, 322.0, 34.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r midi",
					"id" : "obj-6",
					"fontname" : "Arial",
					"numinlets" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 421.0, 337.0, 40.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "scale -0.5 0.5 0 127",
					"id" : "obj-18",
					"fontname" : "Arial",
					"numinlets" : 6,
					"fontsize" : 12.0,
					"patching_rect" : [ 355.0, 230.0, 116.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bendout",
					"id" : "obj-16",
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"patching_rect" : [ 340.0, 356.0, 54.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i 80",
					"id" : "obj-15",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 205.0, 217.0, 51.0, 20.0 ],
					"numoutlets" : 3,
					"outlettype" : [ "bang", "int", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "int",
					"id" : "obj-12",
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"patching_rect" : [ 205.0, 266.0, 34.5, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t 0 b 0",
					"id" : "obj-5",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 74.0, 255.0, 46.0, 20.0 ],
					"numoutlets" : 3,
					"outlettype" : [ "int", "bang", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel off",
					"id" : "obj-4",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 74.0, 222.0, 43.0, 20.0 ],
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack i s f",
					"id" : "obj-1",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 48.0, 186.0, 71.0, 20.0 ],
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set $1 nn nn",
					"id" : "obj-32",
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"patching_rect" : [ 68.0, 129.0, 77.0, 18.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "match",
					"id" : "obj-17",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 48.0, 154.0, 43.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-13",
					"numinlets" : 1,
					"patching_rect" : [ 163.0, 156.0, 20.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 1",
					"id" : "obj-9",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 284.0, 28.0, 30.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r notes",
					"id" : "obj-8",
					"fontname" : "Arial",
					"numinlets" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 48.0, 37.0, 47.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "noteout",
					"id" : "obj-7",
					"fontname" : "Arial",
					"numinlets" : 3,
					"fontsize" : 12.0,
					"patching_rect" : [ 190.0, 356.0, 113.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"id" : "obj-3",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 246.0, 147.0, 60.0, 20.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "thispoly~",
					"id" : "obj-2",
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 246.0, 175.0, 58.0, 20.0 ],
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-15", 1 ],
					"destination" : [ "obj-12", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [ 83.5, 317.0, 349.5, 317.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 83.5, 317.0, 199.5, 317.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 1 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [ 97.0, 279.0, 180.0, 279.0, 180.0, 256.0, 214.5, 256.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 2 ],
					"destination" : [ "obj-7", 1 ],
					"hidden" : 0,
					"midpoints" : [ 110.5, 348.0, 246.5, 348.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 2 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [ 110.5, 279.0, 149.0, 279.0, 149.0, 148.0, 172.5, 148.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-16", 1 ],
					"hidden" : 0,
					"midpoints" : [ 255.5, 263.0, 384.5, 263.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 2 ],
					"destination" : [ "obj-7", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 1 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-7", 2 ],
					"hidden" : 0,
					"midpoints" : [ 255.5, 263.0, 293.5, 263.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-10", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 2 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [ 109.5, 208.0, 364.5, 208.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-19", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 293.5, 110.0, 214.5, 110.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 1 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [ 307.0, 79.0, 77.5, 79.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 2 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [ 320.5, 92.0, 172.5, 92.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 3 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 334.0, 158.0, 477.0, 158.0, 477.0, 299.0, 199.5, 299.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 3 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [ 334.0, 158.0, 477.0, 158.0, 477.0, 299.0, 349.5, 299.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 4 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [ 347.5, 138.0, 490.0, 138.0, 490.0, 352.0, 349.5, 352.0 ]
				}

			}
 ]
	}

}
