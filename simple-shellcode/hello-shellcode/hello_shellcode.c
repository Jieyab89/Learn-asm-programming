#include <sys/mman.h>
#include <string.h>

// Add byte from chapter 1 or testing and compile it, then you can using gdb for get the byte
static const unsigned char p[] = "\xb8\x01\x00\x00\x00\xbf\x01\x00\x00\x00\x48\x8d\x35\x10\x00\x00\x00\xba\x0d\x00\x00\x00\x0f\x05\xb8\x3c\x00\x00\x00\x31\xff\x0f\x05\x48\x65\x6c\x6c\x6f\x20\x57\x6f\x72\x6c\x64\x21\x0a\x00\x00";

int main(void)
{
    void (*code)(void) = mmap(NULL, 1024, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
    memcpy(code, p, sizeof(p));
    code();
    return 0;
}
