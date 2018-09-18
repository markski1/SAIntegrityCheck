program SA_Integrity_Check;
uses md5, crt, sysutils;

function mensaje (msj: string; leng: integer): String;
begin
	case msj of
		'advertencia': if ( leng = 1 ) then mensaje := 'Please make sure to run this executable in your San Andreas folder. Enter 1 to continue, 0 to exit.' else mensaje := 'Por favor asegurate de estar ejecutando este programa en la carpeta de San Andreas. Ingresa 1 para continuar, 0 para salir.';
		'cancelado': if ( leng = 1 ) then mensaje := 'The program execution has been canceled, no check has been done.' else mensaje := 'Se ha cancelado la ejecucion del programa y no se ha realizado ningun chequeo';
		'colgar': if ( leng = 1 ) then mensaje := 'Please note this process could take a long while and even render your computer slow during its duration depending on your specs. Write any number and enter to continue.' else mensaje := 'Por favor tenga en cuenta que este proceso puede tardar un tiempo e incluso volver tu computadora lenta durante la duracion del chequeo, dependiendo de tus especificaciones. Ingresa cualquier numero y enter para continuar.';
		'visual': if ( leng = 1 ) then mensaje := 'Enter 1 to check essential files that could mean cheats or other unexpected effects. Press 2 to make a more complete procedure that checks files that modify visual aspect.' else mensaje := 'Ingrese 1 para hacer un chequeo de los archivos esenciales, que podrian significar cheats u otros cambios en el juego. Ingrese 2 para hacer un chequeo mas completo que incluye archivos visuales.';
		'chequeando': if ( leng = 1 ) then mensaje := 'Now beggining integrity check...' else mensaje := 'Comenzando chequeo de integridad...';
		'inconsistencia': if ( leng = 1 ) then mensaje := 'INCONSISTENCY FOUND IN: ' else mensaje := 'INCONSISTENCIA ENCONTRADA EN: ';
		'finalizado': if ( leng = 1 ) then mensaje := 'Check finished.' else mensaje := 'Chequeo finalizado.';
		'mal': if ( leng = 1 ) then mensaje := ' inconcistency found. A report is available in the file IntegirtyReport.txt' else mensaje := ' inconsistencia(s) encontrada(s). Un reporte esta disponible en IntegrityReport.txt';
		'nada': if ( leng = 1 ) then mensaje := 'No modified files were found, your GTA:SA install is in perfect stock state.' else mensaje := 'No se han encontrado archivos modificados. Tu instalacion de GTA:SA esta en perfecto estado.';
		'salir': if ( leng = 1 ) then mensaje := 'You may now close the program.' else mensaje := 'Usted puede ahora cerrar el programa.';
		else 
			mensaje := 'Error de lenguajes.'
	end;
end;

procedure chequearArchivo (lenguaje: integer; var err: integer; var irreg: string; defecto: string; lugar: string; var a: text);
var
	hasheo: String;
	auxiliar: String;
begin
	hasheo := MD5Print(MD5File(lugar));
	if hasheo <> defecto then begin
		err := err + 1;
		writeln(mensaje('inconsistencia', lenguaje), lugar)
		;
		auxiliar := 'Archivo/File: ' + lugar + ' | MD5 original: ' + defecto + ' ; MD5 encontrado/found: ' + hasheo;
		writeln(a, auxiliar);
		irreg := irreg + auxiliar;
	end;
end;


var
	i: Integer;
	lenguaje: Integer;
	err: Integer;
	inconsistencias: String;
	arch: text;
begin
	err := 0;
	inconsistencias := '';
	writeln('Choose language / Elija su lenguaje');
	writeln('1 - English - Ingles');
	writeln('2 - Spanish - Castellano');
	readln(lenguaje);
	clrscr;
	writeln (mensaje('advertencia', lenguaje));
	readln(i);
	if i = 1 then begin
		Assign(arch, 'IntegrityReport.txt');
		Rewrite(arch);
		writeln (mensaje('colgar', lenguaje));
		readln(i);
		clrscr;
		writeln (mensaje('chequeando', lenguaje));
		chequearArchivo(lenguaje, err, inconsistencias, '2840f08dd9753a5b13c60d6d1c165c9a', 'vorbis.dll', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '90223f6248b55e0813687fe1b7277dd7', 'vorbisFile.dll', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '2b7b803311d2b228f065c45d13e1aeb2', 'vorbisHooked.dll', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '309d860fc8137e5fe9e7056c33b4b8be', 'eax.dll', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '2afcb246fe97406b47f4c59deaf5b716', './anim/cuts.img', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '3359ba8cb820299161199ee7ef3f1c02', './anim/anim.img', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '4736b2c90b00981255f9507308ee9174', './anim/ped.ifp', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '6a484b0b2356c524207d939487f1bff1', './data/animgrp.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, 'f856ba3a4ba25ae10b561aa764fba0c4', './data/animviewer.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '2b33843e79bd113873a5d0fb02157749', './data/carcols.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '63138ab62a10428a7c88f0be8ece094d', './data/cargrp.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '6cbe845361e76aae35ddca300867cadf', './data/carmods.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '8762637e580eb936111859ffa29bddb4', './data/clothes.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '8e133355396761bd5cd16bf873154b30', './data/default.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '795a9c013ee683e286768e06e4a5e2d7', './data/gridref.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '2d2e4f7f05e2d82b25c88707096d3393', './data/gta.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '012841ec691f84de4606ddcbff89e997', './data/gta_quick.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '6868accef933f1855ec28ce193a78159', './data/handling.cfg', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '79d255c7a27bb49b50d680390e908e5a', './data/map.zon', arch);
		chequearArchivo(lenguaje, err, inconsistencias, 'b2f05657980e4a693f8ff5eadcbad8f8', './data/melee.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '46a5e7dff90078842e24d9de5e92cc3e', './data/object.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '67d960dde13228d4818e0f144adafe4e', './data/ped.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, 'fa1731066423ba0c584e757eda946f15', './data/pedgrp.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, 'd722c90c92f3ad5c1b531596769f61cd', './data/pedstats.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, 'a2713338dbbd55898a4195e4464c6b06', './data/plants.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '9eb4e4e474abd5da2f3961a5ef549f9e', './data/surface.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, 'c32c586e8ba35742e356e6525619f7c3', './data/surfaud.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '605dd0beabccc797ce94a51a3e4a09eb', './data/surfinfo.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, 'd66a121bc8f17a5b69e34b841744956c', './data/timecyc.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, 'c91ce6b9f69578dc0fcd890f6147224c', './data/timecycp.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, 'bdc3a0fced2402c5bc61585714457d4b', './data/vehicles.ide', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '690400ecc92169d9eaddaaa948903efb', './data/water.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '16fe5a3e8c57d02eb62a44a96d8b9d39', './data/water1.dat', arch);
		chequearArchivo(lenguaje, err, inconsistencias, '0a9bb49003680364f9f9768e9bcea982', './data/weapon.dat', arch);
		writeln (mensaje('finalizado', lenguaje));
		if err > 0 then begin
			writeln(err, mensaje('mal', lenguaje));
		end else begin
			writeln(mensaje('nada', lenguaje));
			write(arch, 'No se encontraron inconsistencias. / No inconsistencies found.');
		end;
		Close(arch);
	end else begin
		writeln (mensaje('cancelado', lenguaje));
	end;
	writeln (mensaje('salir', lenguaje));
	delay (65535);
end.
