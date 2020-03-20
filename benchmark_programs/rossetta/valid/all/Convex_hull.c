#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct tPoint {
    int x, y;
} Point;

typedef struct tNode {
    Point data;
    struct tNode *next;
} Node;

bool ccw(const Point *a, const Point *b, const Point *c) {
    return (b->x - a->x) * (c->y - a->y)
         > (b->y - a->y) * (c->x - a->x);
}

int comp(const void *lhs, const void *rhs) {
    Point lp = *((Point *)lhs);
    Point rp = *((Point *)rhs);
    if (lp.x < rp.x) return -1;
    if (rp.x < lp.x) return 1;
    return 0;
}

void freeNode(Node *ptr) {
    if (ptr == NULL) {
        return;
    }

    freeNode(ptr->next);
    ptr->next = NULL;
    free(ptr);
}

Node* pushBack(Node *ptr, Point data) {
    Node *tmp = ptr;

    if (ptr == NULL) {
        ptr = (Node*)malloc(sizeof(Node));
        ptr->data = data;
        ptr->next = NULL;
        return ptr;
    }

    while (tmp->next != NULL) {
        tmp = tmp->next;
    }

    tmp->next = (Node*)malloc(sizeof(Node));
    tmp->next->data = data;
    tmp->next->next = NULL;
    return ptr;
}

Node* popBack(Node *ptr) {
    Node *tmp = ptr;

    if (ptr == NULL) {
        return NULL;
    }
    if (ptr->next == NULL) {
        free(ptr);
        return NULL;
    }

    while (tmp->next->next != NULL) {
        tmp = tmp->next;
    }

    free(tmp->next);
    tmp->next = NULL;
    return ptr;
}

void print(Node *ptr) {
    printf("[");
    if (ptr != NULL) {
        printf("(%d, %d)", ptr->data.x, ptr->data.y);
        ptr = ptr->next;
    }
    while (ptr != NULL) {
        printf(", (%d, %d)", ptr->data.x, ptr->data.y);
        ptr = ptr->next;
    }
    printf("]");
}

Node* convexHull(int len, Point p[]) {
    Node *h = NULL;
    Node *hptr = NULL;
    size_t hLen = 0;
    int i;

    qsort(p, len, sizeof(Point), comp);

    /* lower hull */
    for (i = 0; i < len; ++i) {
        while (hLen >= 2) {
            hptr = h;
            while (hptr->next->next != NULL) {
                hptr = hptr->next;
            }
            if (ccw(&hptr->data, &hptr->next->data, &p[i])) {
                break;
            }

            h = popBack(h);
            hLen--;
        }

        h = pushBack(h, p[i]);
        hLen++;
    }

    /* upper hull */
    for (i = len - 1; i >= 0; i--) {
        while (hLen >= 2) {
            hptr = h;
            while (hptr->next->next != NULL) {
                hptr = hptr->next;
            }
            if (ccw(&hptr->data, &hptr->next->data, &p[i])) {
                break;
            }

            h = popBack(h);
            hLen--;
        }

        h = pushBack(h, p[i]);
        hLen++;
    }

    popBack(h);
    return h;
}

int main() {
    Point points[] = {
        {16,  3}, {12, 17}, { 0,  6}, {-4, -6}, {16,  6},
        {16, -7}, {16, -3}, {17, -4}, { 5, 19}, {19, -8},
        { 3, 16}, {12, 13}, { 3, -4}, {17,  5}, {-3, 15},
        {-3, -9}, { 0, 11}, {-9, -3}, {-4, -2}, {12, 10}
    };

    Node *hull = convexHull(sizeof(points) / sizeof(Point), points);
    printf("Convex Hull: ");
    print(hull);
    printf("\n");

    freeNode(hull);
    hull = NULL;

    return 0;
}