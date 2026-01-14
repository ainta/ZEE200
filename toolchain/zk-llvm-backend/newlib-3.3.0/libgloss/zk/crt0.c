void
_start(void)
{
	asm("HACK in _start");
	_init();
	constr();
	main();
	destru();
	exit(0);
}
