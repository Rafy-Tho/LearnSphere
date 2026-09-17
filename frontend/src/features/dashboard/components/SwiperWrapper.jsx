// Import Swiper React components
import { Swiper } from "swiper/react";

// Import Swiper styles
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import "@/css/SwiperWrapper.css";
// import required modules
import { A11y, Keyboard, Navigation, Pagination } from "swiper/modules";
import cn from "@/utils/cn";

export default function SwiperWrapper({ children, className }) {
  return (
    <Swiper
      className={cn("mySwiper", className)}
      modules={[A11y, Keyboard, Navigation, Pagination]}
      a11y={{ enabled: true }}
      keyboard={{ enabled: true }}
      navigation={{ enabled: true }}
      pagination={{ clickable: true }}
      grabCursor
      watchOverflow
      slidesPerGroup={1}
      breakpoints={{
        0: { slidesPerView: 1, spaceBetween: 16 },
        640: { slidesPerView: 2, spaceBetween: 20 },
        1024: { slidesPerView: 3, spaceBetween: 24 },
        1280: { slidesPerView: 4, spaceBetween: 24 },
      }}
    >
      {children}
    </Swiper>
  );
}
