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
    public class DoctorDischargesController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: DoctorDischarges
        public ActionResult Index()
        {
            var doctorDischarges = db.DoctorDischarges.Include(d => d.Drug).Include(d => d.Drug1).Include(d => d.Drug2).Include(d => d.Patient);
            return View(doctorDischarges.ToList());
        }

        // GET: DoctorDischarges/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DoctorDischarge doctorDischarge = db.DoctorDischarges.Find(id);
            if (doctorDischarge == null)
            {
                return HttpNotFound();
            }
            return View(doctorDischarge);
        }

        // GET: DoctorDischarges/Create
        public ActionResult Create()
        {
            ViewBag.DrugID1 = new SelectList(db.Drugs, "DrugID", "DrugName");
            ViewBag.DrugID2 = new SelectList(db.Drugs, "DrugID", "DrugName");
            ViewBag.DrugID3 = new SelectList(db.Drugs, "DrugID", "DrugName");
            ViewBag.PatientID = new SelectList(db.Patients, "PatientID", "PatientID");
            return View();
        }

        // POST: DoctorDischarges/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DischargeID,PatientID,DrugID1,DrugID2,DrugID3")] DoctorDischarge doctorDischarge)
        {
            if (ModelState.IsValid)
            {
                doctorDischarge.DischargeID = Guid.NewGuid();
                db.DoctorDischarges.Add(doctorDischarge);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DrugID1 = new SelectList(db.Drugs, "DrugID", "DrugName", doctorDischarge.DrugID1);
            ViewBag.DrugID2 = new SelectList(db.Drugs, "DrugID", "DrugName", doctorDischarge.DrugID2);
            ViewBag.DrugID3 = new SelectList(db.Drugs, "DrugID", "DrugName", doctorDischarge.DrugID3);
            ViewBag.PatientID = new SelectList(db.Patients, "PatientID", "PatientID", doctorDischarge.PatientID);
            return View(doctorDischarge);
        }

        // GET: DoctorDischarges/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DoctorDischarge doctorDischarge = db.DoctorDischarges.Find(id);
            if (doctorDischarge == null)
            {
                return HttpNotFound();
            }
            ViewBag.DrugID1 = new SelectList(db.Drugs, "DrugID", "DrugName", doctorDischarge.DrugID1);
            ViewBag.DrugID2 = new SelectList(db.Drugs, "DrugID", "DrugName", doctorDischarge.DrugID2);
            ViewBag.DrugID3 = new SelectList(db.Drugs, "DrugID", "DrugName", doctorDischarge.DrugID3);
            ViewBag.PatientID = new SelectList(db.Patients, "PatientID", "PatientID", doctorDischarge.PatientID);
            return View(doctorDischarge);
        }

        // POST: DoctorDischarges/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DischargeID,PatientID,DrugID1,DrugID2,DrugID3")] DoctorDischarge doctorDischarge)
        {
            if (ModelState.IsValid)
            {
                db.Entry(doctorDischarge).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DrugID1 = new SelectList(db.Drugs, "DrugID", "DrugName", doctorDischarge.DrugID1);
            ViewBag.DrugID2 = new SelectList(db.Drugs, "DrugID", "DrugName", doctorDischarge.DrugID2);
            ViewBag.DrugID3 = new SelectList(db.Drugs, "DrugID", "DrugName", doctorDischarge.DrugID3);
            ViewBag.PatientID = new SelectList(db.Patients, "PatientID", "PatientID", doctorDischarge.PatientID);
            return View(doctorDischarge);
        }

        // GET: DoctorDischarges/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DoctorDischarge doctorDischarge = db.DoctorDischarges.Find(id);
            if (doctorDischarge == null)
            {
                return HttpNotFound();
            }
            return View(doctorDischarge);
        }

        // POST: DoctorDischarges/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            DoctorDischarge doctorDischarge = db.DoctorDischarges.Find(id);
            db.DoctorDischarges.Remove(doctorDischarge);
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
