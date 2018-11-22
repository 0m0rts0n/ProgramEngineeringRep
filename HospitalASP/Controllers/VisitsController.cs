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
    public class VisitsController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: Visits
        public ActionResult Index()
        {
            var visits = db.Visits.Include(v => v.Doctor).Include(v => v.Patient).Include(v => v.Reception);
            return View(visits.ToList());
        }

        // GET: Visits/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Visit visit = db.Visits.Find(id);
            if (visit == null)
            {
                return HttpNotFound();
            }
            return View(visit);
        }

        // GET: Visits/Create
        public ActionResult Create()
        {
            ViewBag.DoctorID = new SelectList(db.Doctors, "DoctorID", "DoctorFullName");
            ViewBag.PatientID = new SelectList(db.Patients, "PatientID", "PatientID");
            ViewBag.ReceptionID = new SelectList(db.Receptions, "ReceptionID", "ReceptionType");
            return View();
        }

        // POST: Visits/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "VisitID,PatientID,DoctorID,ReceptionDateTime,ReceptionID")] Visit visit)
        {
            if (ModelState.IsValid)
            {
                visit.VisitID = Guid.NewGuid();
                db.Visits.Add(visit);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DoctorID = new SelectList(db.Doctors, "DoctorID", "DoctorFullName", visit.DoctorID);
            ViewBag.PatientID = new SelectList(db.Patients, "PatientID", "PatientID", visit.PatientID);
            ViewBag.ReceptionID = new SelectList(db.Receptions, "ReceptionID", "ReceptionType", visit.ReceptionID);
            return View(visit);
        }

        // GET: Visits/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Visit visit = db.Visits.Find(id);
            if (visit == null)
            {
                return HttpNotFound();
            }
            ViewBag.DoctorID = new SelectList(db.Doctors, "DoctorID", "DoctorFullName", visit.DoctorID);
            ViewBag.PatientID = new SelectList(db.Patients, "PatientID", "PatientID", visit.PatientID);
            ViewBag.ReceptionID = new SelectList(db.Receptions, "ReceptionID", "ReceptionType", visit.ReceptionID);
            return View(visit);
        }

        // POST: Visits/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "VisitID,PatientID,DoctorID,ReceptionDateTime,ReceptionID")] Visit visit)
        {
            if (ModelState.IsValid)
            {
                db.Entry(visit).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DoctorID = new SelectList(db.Doctors, "DoctorID", "DoctorFullName", visit.DoctorID);
            ViewBag.PatientID = new SelectList(db.Patients, "PatientID", "PatientID", visit.PatientID);
            ViewBag.ReceptionID = new SelectList(db.Receptions, "ReceptionID", "ReceptionType", visit.ReceptionID);
            return View(visit);
        }

        // GET: Visits/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Visit visit = db.Visits.Find(id);
            if (visit == null)
            {
                return HttpNotFound();
            }
            return View(visit);
        }

        // POST: Visits/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Visit visit = db.Visits.Find(id);
            db.Visits.Remove(visit);
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
