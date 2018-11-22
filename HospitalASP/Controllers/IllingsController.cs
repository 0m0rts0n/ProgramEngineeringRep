using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HospitalASP;

namespace HospitalASP.Controllers
{
    public class IllingsController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: Illings
        public ActionResult Index()
        {
            return View(db.Illings.ToList());
        }

        // GET: Illings/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Illing illing = db.Illings.Find(id);
            if (illing == null)
            {
                return HttpNotFound();
            }
            return View(illing);
        }

        // GET: Illings/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Illings/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IllingID,IllingName,Symptomatology,TreatDiseaseDuration")] Illing illing)
        {
            if (ModelState.IsValid)
            {
                illing.IllingID = Guid.NewGuid();
                db.Illings.Add(illing);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(illing);
        }

        // GET: Illings/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Illing illing = db.Illings.Find(id);
            if (illing == null)
            {
                return HttpNotFound();
            }
            return View(illing);
        }

        // POST: Illings/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IllingID,IllingName,Symptomatology,TreatDiseaseDuration")] Illing illing)
        {
            if (ModelState.IsValid)
            {
                db.Entry(illing).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(illing);
        }

        // GET: Illings/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Illing illing = db.Illings.Find(id);
            if (illing == null)
            {
                return HttpNotFound();
            }
            return View(illing);
        }

        // POST: Illings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Illing illing = db.Illings.Find(id);
            db.Illings.Remove(illing);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
