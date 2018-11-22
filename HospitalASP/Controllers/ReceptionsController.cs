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
    public class ReceptionsController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: Receptions
        public ActionResult Index()
        {
            return View(db.Receptions.ToList());
        }

        // GET: Receptions/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reception reception = db.Receptions.Find(id);
            if (reception == null)
            {
                return HttpNotFound();
            }
            return View(reception);
        }

        // GET: Receptions/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Receptions/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ReceptionID,ReceptionType")] Reception reception)
        {
            if (ModelState.IsValid)
            {
                reception.ReceptionID = Guid.NewGuid();
                db.Receptions.Add(reception);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(reception);
        }

        // GET: Receptions/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reception reception = db.Receptions.Find(id);
            if (reception == null)
            {
                return HttpNotFound();
            }
            return View(reception);
        }

        // POST: Receptions/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ReceptionID,ReceptionType")] Reception reception)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reception).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(reception);
        }

        // GET: Receptions/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reception reception = db.Receptions.Find(id);
            if (reception == null)
            {
                return HttpNotFound();
            }
            return View(reception);
        }

        // POST: Receptions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Reception reception = db.Receptions.Find(id);
            db.Receptions.Remove(reception);
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
