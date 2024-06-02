#include <Windows.h>
#include <stdio.h>

extern "C" void Play(int* notes, int count);

extern "C" void Done(char const* msg)
{
    printf("%s\n", msg);
}

int main()
{
    int notes[] = {
          264, 250,
          264, 250,
          297, 1000,
          264, 1000,
          352, 1000,
          330, 2000,
          264, 250,
          264, 250,
          297, 1000,
          264, 1000,
          396, 1000,
          352, 2000,
          264, 250,
          264, 250,
          264, 1000,
          440, 1000,
          352, 500,
          352, 250,
          330, 1000,
          297, 2000,
          466, 250,
          466, 250,
          440, 1000,
          352, 1000,
          396, 1000,
          352, 2000
    };

    Play(notes, _countof(notes) / 2);

    return 0;
}