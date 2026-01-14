#ifndef CYCLE_H__
#define CYCLE_H__


// TODO fix
/* template <typename T> */
/* struct CycleQueue { */
/*   public: */
/*     struct Iterator { */
/*       std::size_t where; */
/*       std::size_t cap; */
/*       std::vector<T>* elems; */

/*       T& operator*() { return (*elems)[where]; } */
/*       const T& operator*() const { return (*elems)[where]; } */
/*       T* operator->() { return &(*elems)[where]; } */

/*       Iterator& operator++() { */
/*         where = (where + 1) % cap; */
/*         return *this; */
/*       } */

/*       Iterator operator++(int) { */
/*         Iterator iterator = *this; */
/*         ++*this; */
/*         return iterator; */
/*       } */

/*       bool operator!=(const Iterator& o) const { */
/*         return where != o.where || elems != o.elems; */
/*       } */

/*       bool operator==(const Iterator& o) const { */
/*         return where == o.where && elems == o.elems; */
/*       } */
/*     }; */


/*     CycleQueue(std::size_t cap) : elems(cap), cap(cap), ixFront(0), ixBack(0) { } */
/*     CycleQueue() { } */

/*     void push_back(const T& t) { */
/*       elems[ixBack] = t; */
/*       ixBack = (ixBack + 1) % cap; */
/*     } */

/*     void push_front(const T& t) { */
/*       ixFront = (ixFront - 1) % cap; */
/*       elems[ixFront] = t; */
/*     } */

/*     void pop_front() { */
/*       ixFront = (ixFront + 1) % cap; */
/*     } */

/*     T& front() { return elems[ixFront]; } */
/*     const T& front() const { return elems[ixFront]; } */

/*     T& back() { return elems[(ixBack - 1) % cap]; } */
/*     const T& back() const { return elems[(ixBack - 1) % cap]; } */

/*     Iterator begin() const { return { ixFront, cap, &elems }; } */
/*     Iterator begin() { return { ixFront, cap, &elems }; } */
/*     Iterator end() const { return { ixBack, cap, &elems }; } */
/*     Iterator end() { return { ixBack, cap, &elems }; } */

/*   private: */
/*     std::vector<T> elems; */
/*     std::size_t cap; */
/*     std::size_t ixFront; */
/*     std::size_t ixBack; */
/* }; */

template <typename T>
struct CycleQueue {
  public:
    CycleQueue(std::size_t cap) : _front(0) { }
    CycleQueue() : _front(0) { }

    void push_back(const T& t) {
      elems.push_back(t);
    }

    void pop_front() { ++_front; }

    T& front() { return elems[_front]; }
    const T& front() const { return elems[_front]; }

    T& back() { return elems.back(); }
    const T& back() const { return elems.back(); }

    auto begin() const { return elems.begin() + _front; }
    auto begin() { return elems.begin() + _front; }
    auto end() const { return elems.end(); }
    auto end() { return elems.end(); }

    std::size_t size() const { return elems.size() - _front; }

  private:
    std::vector<T> elems;
    std::size_t _front;
};


#endif
