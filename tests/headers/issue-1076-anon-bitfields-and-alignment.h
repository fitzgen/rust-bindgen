/**
 * Because anonymous bitfields can't be read, we don't need to worry about
 * unaligned reads, and therefore they don't contribute to alignment.
 */
struct S1 {
    signed : 15;
    unsigned : 6
};
