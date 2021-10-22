all: a.img

a.img: boot.asm
	nasm boot.asm -o boot.bin
	dd if=boot.bin of=a.img
	dd if=/dev/zero of=a.img seek=1 bs=512 count=2879
run:
	bochs -q -f ./linux.bxrc
win:
	bochs -q -f ./win32.bxrc
x:
	bochs -q -f ./x.bxrc

clean:
	rm -rf a.img boot.bin bochsout.txt
