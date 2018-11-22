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
    public class PoliciesController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: Policies
        public ActionResult Index()
        {
            var policies = db.Policies.Include(p => p.Agency);
            return View(policies.ToList());
        }

        // GET: Policies/Details/5
        public ActionResult Details(decimal id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Policy policy = db.Policies.Find(id);
            if (policy == null)
            {
                return HttpNotFound();
            }
            return View(policy);
        }

        // GET: Policies/Create
        public ActionResult Create()
        {
            ViewBag.AgencyID = new SelectList(db.Agencies, "AgencyID", "AgencyName");
            return View();
        }

        // POST: Policies/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PolicyNum,AgencyID,PatientFullName,PatientBirthDate,PatientAddress,PatientIssueDate,PatientExpiredDate")] Policy policy)
        {
            if (ModelState.IsValid)
            {
                db.Policies.Add(policy);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AgencyID = new SelectList(db.Agencies, "AgencyID", "AgencyName", policy.AgencyID);
            return View(policy);
        }

        // GET: Policies/Edit/5
        public ActionResult Edit(decimal id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Policy policy = db.Policies.Find(id);
            if (policy == null)
            {
                return HttpNotFound();
            }
            ViewBag.AgencyID = new SelectList(db.Agencies, "AgencyID", "AgencyName", policy.AgencyID);
            return View(policy);
        }

        // POST: Policies/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PolicyNum,AgencyID,PatientFullName,PatientBirthDate,PatientAddress,PatientIssueDate,PatientExpiredDate")] Policy policy)
        {
            if (ModelState.IsValid)
            {
                db.Entry(policy).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AgencyID = new SelectList(db.Agencies, "AgencyID", "AgencyName", policy.AgencyID);
            return View(policy);
        }

        // GET: Policies/Delete/5
        public ActionResult Delete(decimal id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Policy policy = db.Policies.Find(id);
            if (policy == null)
            {
                return HttpNotFound();
            }
            return View(policy);
        }

        // POST: Policies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(decimal id)
        {
            Policy policy = db.Policies.Find(id);
            db.Policies.Remove(policy);
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
