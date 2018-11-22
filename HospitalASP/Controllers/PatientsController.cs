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
    public class PatientsController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: Patients
        public ActionResult Index()
        {
            var patients = db.Patients.Include(p => p.PatientCard).Include(p => p.Policy);
            return View(patients.ToList());
        }

        // GET: Patients/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Patient patient = db.Patients.Find(id);
            if (patient == null)
            {
                return HttpNotFound();
            }
            return View(patient);
        }

        // GET: Patients/Create
        public ActionResult Create()
        {
            ViewBag.PatientCardNum = new SelectList(db.PatientCards, "PatientCardNum", "CardOwnerFIO");
            ViewBag.PolicyID = new SelectList(db.Policies, "PolicyNum", "PatientFullName");
            return View();
        }

        // POST: Patients/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PatientID,PolicyID,PatientCardNum")] Patient patient)
        {
            if (ModelState.IsValid)
            {
                patient.PatientID = Guid.NewGuid();
                db.Patients.Add(patient);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PatientCardNum = new SelectList(db.PatientCards, "PatientCardNum", "CardOwnerFIO", patient.PatientCardNum);
            ViewBag.PolicyID = new SelectList(db.Policies, "PolicyNum", "PatientFullName", patient.PolicyID);
            return View(patient);
        }

        // GET: Patients/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Patient patient = db.Patients.Find(id);
            if (patient == null)
            {
                return HttpNotFound();
            }
            ViewBag.PatientCardNum = new SelectList(db.PatientCards, "PatientCardNum", "CardOwnerFIO", patient.PatientCardNum);
            ViewBag.PolicyID = new SelectList(db.Policies, "PolicyNum", "PatientFullName", patient.PolicyID);
            return View(patient);
        }

        // POST: Patients/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PatientID,PolicyID,PatientCardNum")] Patient patient)
        {
            if (ModelState.IsValid)
            {
                db.Entry(patient).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PatientCardNum = new SelectList(db.PatientCards, "PatientCardNum", "CardOwnerFIO", patient.PatientCardNum);
            ViewBag.PolicyID = new SelectList(db.Policies, "PolicyNum", "PatientFullName", patient.PolicyID);
            return View(patient);
        }

        // GET: Patients/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Patient patient = db.Patients.Find(id);
            if (patient == null)
            {
                return HttpNotFound();
            }
            return View(patient);
        }

        // POST: Patients/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Patient patient = db.Patients.Find(id);
            db.Patients.Remove(patient);
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
