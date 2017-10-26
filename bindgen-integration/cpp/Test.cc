#include "Test.h"
#include <cstdio>

const int Test::COUNTDOWN[] = { 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };
const int* Test::COUNTDOWN_PTR = Test::COUNTDOWN;

const int* Test::countdown() {
  return COUNTDOWN;
}

const char* Test::name() {
  return "Test";
}

Test::Test(int foo)
  : m_int(foo)
  , m_double(0.0)
{}

Test::Test(double foo)
  : m_int(0)
  , m_double(foo)
{}

AutoRestoreBool::AutoRestoreBool(bool* ptr)
  : m_ptr(ptr)
  , m_value(*ptr)
{}

AutoRestoreBool::~AutoRestoreBool() {
  *m_ptr = m_value;
}

namespace bitfields {

bool
First::assert(unsigned char first,
              unsigned char second,
              unsigned char third)
{
    printf("\n");
    printf("First::assert(%d, %d, %d)\n", first, second, third);
    printf("       actual(%d, %d, %d)\n",
           three_bits_byte_one,
           six_bits_byte_two,
           two_bits_byte_two);
    return three_bits_byte_one == first &&
        six_bits_byte_two == second &&
        two_bits_byte_two == third;
}

bool
Second::assert(int first, bool second)
{
    printf("\n");
    printf("Second::assert(%d, %s)\n", first, second ? "true" : "false");
    printf("        actual(%d, %s)\n", thirty_one_bits, one_bit ? "true" : "false");
    return thirty_one_bits == first && one_bit == second;
}

bool
Third::assert(int first, bool second, ItemKind third)
{
    printf("\n");
    printf("Third::assert(%d, %s, %d)\n",
           first,
           second ? "true" : "false",
           third);
    printf("       actual(%d, %s, %d)\n",
           flags,
           is_whatever ? "true" : "false",
           kind);
    return flags == first &&
        is_whatever == second &&
        kind == third;
}

bool
Fourth::assert(MyEnum tag, unsigned long ptr)
{
    printf("\n");
    printf("Fourth::assert(%d, %d)\n", tag, (int)ptr);
    printf("        actual(%d, %d)\n", this->tag, (int)this->ptr);
    return this->tag == tag && this->ptr == ptr;
}

bool
Date2::assert(unsigned short nWeekDay,
              unsigned short nMonthDay,
              unsigned short nMonth,
              unsigned short nYear,
              unsigned short byte)
{
    printf("\n");
    printf("Date2::assert(%d, %d, %d, %d, %d)\n",
           nWeekDay,
           nMonthDay,
           nMonth,
           nYear,
           byte);
    printf("       actual(%d, %d, %d, %d, %d)\n",
           this->nWeekDay,
           this->nMonthDay,
           this->nMonth,
           this->nYear,
           this->byte);
    return this->nWeekDay == nWeekDay &&
        this->nMonthDay == nMonthDay &&
        this->nMonth == nMonth &&
        this->nYear == nYear &&
        this->byte == byte;
}

bool
Fifth::assert(unsigned short nWeekDay,
              unsigned short nMonthDay,
              unsigned short nMonth,
              unsigned short nYear,
              unsigned char byte)
{
    printf("\n");
    printf("Fifth::assert(%d, %d, %d, %d, %d)\n",
           nWeekDay,
           nMonthDay,
           nMonth,
           nYear,
           byte);
    printf("       actual(%d, %d, %d, %d, %d)\n",
           this->nWeekDay,
           this->nMonthDay,
           this->nMonth,
           this->nYear,
           this->byte);
    return this->nWeekDay == nWeekDay &&
        this->nMonthDay == nMonthDay &&
        this->nMonth == nMonth &&
        this->nYear == nYear &&
        this->byte == byte;
}

bool
Sixth::assert(unsigned char byte,
              unsigned char nWeekDay,
              unsigned char nMonth,
              unsigned char nMonthDay) {
    printf("\n");
    printf("Sixth::assert(%d, %d, %d, %d)\n",
           byte,
           nWeekDay,
           nMonth,
           nMonthDay);
    printf("       actual(%d, %d, %d, %d)\n",
           this->byte,
           this->nWeekDay,
           this->nMonthDay,
           this->nMonth);
    return this->nWeekDay == nWeekDay &&
        this->nMonthDay == nMonthDay &&
        this->nMonth == nMonth &&
        this->byte == byte;
};

} // namespace bitfields
