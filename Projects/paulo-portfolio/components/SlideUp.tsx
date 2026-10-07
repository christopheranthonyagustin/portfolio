"use client"
import {useEffect,useRef,useState} from "react"
export default function SlideUp({children}:{children:React.ReactNode;offset?:string}){const ref=useRef<HTMLDivElement>(null);const [visible,setVisible]=useState(false);useEffect(()=>{const el=ref.current;if(!el)return;const observer=new IntersectionObserver(([entry])=>{if(entry.isIntersecting)setVisible(true)},{threshold:0.1});observer.observe(el);return()=>observer.disconnect()},[]);return <div ref={ref} className={visible?"animate-slideUpCubiBezier":"opacity-0"}>{children}</div>}
