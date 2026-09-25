(async()=>{
  const n=57;
  async function load(base){
    return Promise.all(Array.from({length:n},(_,i)=>
      fetch(base+"p"+String(i).padStart(2,"0")+".txt").then(function(r){
        if(!r.ok) throw new Error("chunk "+i+": "+r.status);
        return r.text();
      })
    ));
  }
  var parts;
  try { parts=await load("/chunks/js/"); }
  catch(e){ parts=await load("https://raw.githubusercontent.com/WellsOnyx/curio-demo-sep25/main/chunks/js/"); }
  var s=document.createElement("script");
  s.text=parts.join("");
  document.head.appendChild(s);
})().catch(function(e){
  console.error(e);
  document.body.innerHTML="<pre style='padding:2rem;color:#c00'>Curio demo failed to load JS: "+e+"</pre>";
});
