
//
// Interface
//
typedef struct Sema *Sema;

Sema Sema_New (int init);
void Sema_P   (Sema s);
void Sema_V   (Sema s);
